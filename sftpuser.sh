#!/bin/bash

CUSTOMER=ilmarketing
echo $CUSTOMER

adduser --home /sftp/$CUSTOMER --shell /bin/false $CUSTOMER --disabled-password 
adduser $CUSTOMER chrooted
eval chown root:root ~$CUSTOMER
eval mkdir ~$CUSTOMER/incoming    

eval chown $CUSTOMER:$CUSTOMER ~$CUSTOMER/incoming
eval mkdir -p ~$CUSTOMER/sftp

eval chmod 755 -R ~$CUSTOMER/sftp
eval cd /sftp/$CUSTOMER/sftp ;  eval ln -s ../incoming ~$CUSTOMER/sftp/$CUSTOMER

eval chmod g+w ~$CUSTOMER/incoming  
eval chmod 775 ~$CUSTOMER/incoming
adduser neolane "$CUSTOMER"

eval mkdir -p  ~$CUSTOMER/.ssh                                                  
eval chown root:$CUSTOMER ~$CUSTOMER/.ssh
eval chmod 710 ~$CUSTOMER/.ssh
eval cd ~$CUSTOMER/.ssh
eval touch authorized_keys

eval chown root:$CUSTOMER ~$CUSTOMER/.ssh/authorized_keys
eval chmod 640 ~$CUSTOMER/.ssh/authorized_keys

eval chage -l $CUSTOMER

eval chage -I -1 -m 0 -M 99999 -E -1 $CUSTOMER

eval passwd -d $CUSTOMER