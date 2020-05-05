#!/bin/bash
cat <<EOF > /etc/init.d/clear-cloud-init.sh
#!/bin/bash
truncate -s 0 "/etc/udev/rules.d/70-persistent-net.rules"
rm -rf "/var/lib/cloud"
EOF

chmod +x /etc/init.d/clear-cloud-init.sh
update-rc.d clear-cloud-init.sh defaults
