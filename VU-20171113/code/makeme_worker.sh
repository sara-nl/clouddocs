#! /bin/bash
set -e    # to exit immediately if any command fails
NEW_HOSTNAME="worker"

if [ ! $# == 2 ]; then
  echo "Usage: $0 <worker_number> <master_ip>"
  exit
fi

re="^[0-9]+$"
if ! [[ $1 =~ $re ]] ; then
   echo "error: *$1* is not a number" >&2; exit 1
fi

hostnamectl set-hostname "$NEW_HOSTNAME$1"

# Disable external interface
EXT_NIC=`ip route get 8.8.8.8 | awk -F"dev " 'NR==1 {split($2,a," ");print a[1]}'`
echo '********************************** NOTE **********************************'
echo 'The next step will disable the INTERNET network interface on this VM.'
echo 'If you are running this on an interactive SSH connection from the internet'
echo '(and that includes X2Go), your session will be terminated.'
echo 'Of course, you can use the noVNC option from the cloud web interface to ,'
echo 'access this VM, and you can still SSH to this VM from any other VM in your'
echo 'group via your INTERNAL network.'
echo '**************************************************************************'
echo 'Press ENTER to continue...'
read NOT_USED
ip link set "$EXT_NIC" down
exec bash
