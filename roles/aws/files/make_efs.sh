#!/bin/sh

# Stop Services
echo "Stopping Services..."
sudo systemctl stop centreontrapd.service
sudo systemctl stop centengine.service
sudo systemctl stop centcore.service
sudo systemctl stop httpd.service
sudo systemctl stop cbd.service

#Centreon Central Master
echo "Migrating Central Master to EFS share..."
sudo mkdir -v -p /mnt/efs/etc/
sudo mv -v /etc/centreon /mnt/efs/etc/
sudo ln -v -s /mnt/efs/etc/centreon /etc/centreon

sudo mkdir -v -p /mnt/efs/var/lib/centreon
sudo mv -v /var/lib/centreon /mnt/efs/var/lib/
sudo ln -v -s /mnt/efs/var/lib/centreon /var/lib/centreon

sudo mkdir -v -p /mnt/efs/var/lib/centreon-engine
sudo mv -v /var/lib/centreon-engine /mnt/efs/var/lib/
sudo ln -v -s /mnt/efs/var/lib/centreon-engine /var/lib/centreon-engine

sudo mkdir -v -p /mnt/efs/var/cache/centreon/backup
sudo mv -v /var/cache/centreon/backup /mnt/efs/var/cache/centreon/
sudo ln -v -s /mnt/efs/var/cache/centreon/backup /var/cache/centreon/backup

sudo mkdir -v -p /mnt/efs/var/log/centreon
sudo mv -v /var/log/centreon /mnt/efs/var/log/
sudo ln -v -s /mnt/efs/var/log/centreon /var/log/centreon

# Centreon Broker
echo "Migrating Broker to EFS share..."
sudo mkdir -v -p /mnt/efs/etc/centreon-broker
sudo mv -v /etc/centreon-broker /mnt/efs/etc/
sudo ln -v -s /mnt/efs/etc/centreon-broker /etc/centreon-broker

sudo mkdir -v -p /mnt/efs/var/lib/centreon-broker
sudo mv -v / /var/lib/centreon-broker /mnt/efs/var/lib/
sudo ln -v -s /mnt/efs/var/lib/centreon-broker /var/lib/centreon-broker

sudo mkdir -v -p /mnt/efs/var/log/centreon-broker
sudo mv -v / /var/log/centreon-broker /mnt/efs/var/log/
sudo ln -v -s /mnt/efs/var/log/centreon-broker /var/log/centreon-broker

#Centreon Poller
echo "Migrating Poller to EFS share..."
sudo mkdir -p /mnt/efs/etc/centreon-engine/
sudo mv -v /etc/centreon-engine/ /mnt/efs/etc/
sudo ln -v -s /mnt/efs/etc/centreon-engine/ /etc/centreon-engine

sudo mkdir -p /mnt/efs/var/log/centreon-engine
sudo mv -v /var/log/centreon-engine /mnt/efs/var/log/
sudo ln -v -s /mnt/efs/var/log/centreon-engine /var/log/centreon-engine

#Centreon and Nagios Plugins
echo "Migrating Plugins to EFS share..."
sudo mkdir -p /mnt/efs/usr/lib/nagios
sudo mv -v /usr/lib/nagios /mnt/efs/usr/lib/
sudo ln -v -s /mnt/efs/usr/lib/nagios /usr/lib/nagios

# Start Services
echo "Starting Services..."
sudo systemctl start centreontrapd.service
sudo systemctl start centengine.service
sudo systemctl start centcore.service
sudo systemctl start httpd.service
sudo systemctl start cbd.service
