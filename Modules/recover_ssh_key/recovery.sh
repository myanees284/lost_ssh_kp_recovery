#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
    sleep 30
    sudo mkdir /mnt/tempvol
    sudo mount /dev/xvdf1 /mnt/tempvol/
    sudo cp .ssh/authorized_keys /mnt/tempvol/home/ec2-user/.ssh/
    sudo umount /mnt/tempvol/