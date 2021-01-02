#!/bin/bash -x

# needed for cloud init, otherwise network doesn't work good
sleep 30 


# get disk name

echo "PREPARE NFS DATA DIRS"
MYDISK=$(lsblk | grep 7G | awk '{print "/dev/"$1}')

/usr/sbin/mkfs.xfs $MYDISK -f
mkdir -p /data
mount $MYDISK /data
echo "$MYDISK        /data   xfs     defaults        0 0" >> /etc/fstab
chown nobody:nogroup /data

echo "INSTALL NFS"
DEBIAN_FRONTEND=noninteractive apt-get -yq update
DEBIAN_FRONTEND=noninteractive apt-get -yq install nfs-kernel-server

echo "CONFIGURE NFS"
cat <<'EOF' > /etc/exports
/data    192.168.200.*(rw,sync,no_subtree_check,no_root_squash)
EOF


echo "CONFIGURE STARTING PAGE"
cat <<'EOF' > /data/index.html
<html>
 <head>
 <title>vhost1 test</title>
 </head>
 <body>
 <h1>Hello, This is a test page for project2.lan website based on ubuntu and apache</h1>
 <h2> built with packer and terraform </h2>
 </body>
</html>
EOF


systemctl enable nfs-kernel-server