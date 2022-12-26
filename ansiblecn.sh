#!/bin/bash

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
yum repolist all
yum install ansible -y
sed -i 's/PasswordAuthentication\ no/PasswordAuthentication\ yes/g' /etc/ssh/sshd_config
systemctl reload sshd.service
echo " " | passwd --stdin root
useradd admin
echo "admin" | passwd --stdin admin
echo "admin    ALL=(ALL)     NOPASSWD:ALL" >> /etc/sudoers

