#!/bin/bash

CUSTOMER=ajay
echo $CUSTOMER

adduser --home /sftp/$CUSTOMER --shell /bin/false $CUSTOMER --disabled-password 
echo "user added"

adduser $CUSTOMER chrooted
echo "added in chrooted"

eval chown root:root ~$CUSTOMER
echo "owener selected"

eval mkdir ~$CUSTOMER/incoming 
echo "directory created"   

eval chown $CUSTOMER:$CUSTOMER ~$CUSTOMER/incoming
echo "owenerselested"

eval mkdir -p ~$CUSTOMER/sftp
echo "sftp directory created"

eval chmod 755 -R ~$CUSTOMER/sftp
echo "permissions provided"

eval cd /sftp/$CUSTOMER/sftp ;  eval ln -s ../incoming ~$CUSTOMER/sftp/$CUSTOMER
echo "incoming ~$CUSTOMER"


eval chmod g+w ~$CUSTOMER/incoming  
echo "permission"

eval chmod 775 ~$CUSTOMER/incoming
echo "permission 775"

adduser neolane "$CUSTOMER"

echo "adduser neolane '$CUSTOMER'"  

eval mkdir -p  ~$CUSTOMER/.ssh 
echo "directory created"                                                 
eval chown root:$CUSTOMER ~$CUSTOMER/.ssh
echo "owenerselested"
eval chmod 710 ~$CUSTOMER/.ssh
echo "permission"

eval cd ~$CUSTOMER/.ssh
echo "key created"
eval touch authorized_keys
echo "authorized key"

eval chown root:$CUSTOMER ~$CUSTOMER/.ssh/authorized_keys
echo "owenerselested"
eval chmod 640 ~$CUSTOMER/.ssh/authorized_keys
echo "permission"
eval chage -l $CUSTOMER
echo "password expiration check"

eval chage -I -1 -m 0 -M 99999 -E -1 $CUSTOMER
echo "password never expire"


eval passwd -d $CUSTOMER
echo "remove password auth"
