#!/bin/bash

VIRDIR_MOUNT="/virdir"
INTERNAL_IP_PATTERN="10\.0\."
GROUP_NUM_RE='^[0-9]+$'
APACHE_SHARE="/vd"
APACHE_CONFIG_FILE="/etc/apache2/sites-available/000-default.conf"

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ $# -eq 0 ]
then
    echo "ERROR!"
    echo "Please provide your project's \"Group name\" as parameter."
    echo "You can find this on the old HPC Cloud user interface in the column \"Group\" of your VM list."
    exit -1
fi

if [ -z "$1" ]
then
    echo "The parameter you supplied as \"Group name\", "$1", is not valid."
    exit -1
fi

GROUP_NAME="$1"

EXT_IP=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')

echo "Trying to find out internal IP..."
INTERNAL_IP=$(ifconfig | grep "$INTERNAL_IP_PATTERN" | awk -F"[: ]+" '/inet addr:/ {print $4}')
GROUP_NUM=$(echo $INTERNAL_IP | cut -d. -f3)

if ! [[ "$GROUP_NUM" =~ $GROUP_NUM_RE ]]
then
    echo "ERROR: Unable to determine Group NUMBER." 1>&2; exit -2
fi
echo "Internal ip found: $INTERNAL_IP --> Group NUMBER = $GROUP_NUM. Group NAME = $GROUP_NAME."

echo "Creating $VIRDIR_MOUNT directory..."
if [ -d "$VIRDIR_MOUNT" ]
then
    echo "WARNING: Directory $VIRDIR_MOUNT already exists..."
    if mount | grep "$VIRDIR_MOUNT" > /dev/null
    then
        echo "ERROR: $VIRDIR_MOUNT is already a mount point. Cannot proceed." 1>&2
        echo "SUGGESTION: Unmount the $VIRDIR_MOUNT mount point if you don't need it and try again." 1>&2
        exit -3
    fi

    if [ "$(ls -A $VIRDIR_MOUNT)" ]
    then
        echo "ERROR: $VIRDIR_MOUNT is **NOT** empty. Cannot proceed." 1>&2; exit -4
    fi

    echo "...but it is useable. So proceeding now..."
fi

# Create the mount point.
mkdir -p "$VIRDIR_MOUNT"
if [ ! -d $VIRDIR_MOUNT ]
then
    echo "ERROR: Unable to create directory "$VIRDIR_MOUNT". Cannot proceed." 1>&2; exit -5
fi
echo "...$VIRDIR_MOUNT directory created!"

# Mount VirDir
echo "Mounting VirDir now on $VIRDIR_MOUNT..."
mount -t nfs4 10.0."$GROUP_NUM".4:/"$GROUP_NAME" "$VIRDIR_MOUNT"
if mount | grep "$VIRDIR_MOUNT" > /dev/null
then
    # There is a mountpoint in the desired location. Can we read there? (i.e.: did we get a good group name?)
    if [ ! -d "$VIRDIR_MOUNT/Scratch" ]
    then
        echo "ERROR: Unable to mount VirDir. Is the provided Group NAME [$GROUP_NAME] correct? Cannot proceed." 1>&2
        umount "$VIRDIR_MOUNT"
        exit -6
    fi
else
    echo "ERROR: Unable to mount VirDir. Cannot proceed." 1>&2; exit -7
fi
echo "Successfully mounted VirDir!"

# Assuming we have Apache2 installed in Ubuntu...
echo "Sharing VirDir now in Apache..."
if [ ! -f "$APACHE_CONFIG_FILE" ]
then
    echo "ERROR: cannot configure Apache. Are you using a Wizard image? Cannot proceed." 1>&2; exit -8
fi

if grep -q "$VIRDIR_MOUNT" "$APACHE_CONFIG_FILE"
then
    echo "WARNING: The Apache config file already has information regarding VirDir. **NOT** touching anything!"
else
    sed -i "/^<\/VirtualHost>/c\
        Alias "$APACHE_SHARE" "$VIRDIR_MOUNT"/Scratch\n\
       <Directory "$VIRDIR_MOUNT"/Scratch>\n\
               Options Indexes FollowSymLinks MultiViews\n\
               AllowOverride None\n\
               Require ip 145.100.56.19\n\
       </Directory>\n\
</VirtualHost>
" "$APACHE_CONFIG_FILE"
fi

echo "...Apache configuration file fixed!"

echo "Restarting Apache..."
service apache2 restart
echo "...done restarting!"

echo "You should now be able to import your images from within the url: 'http://$EXT_IP$APACHE_SHARE/'"
echo "And here is the list of files that you have available there:"
ls -l "$VIRDIR_MOUNT/Scratch"