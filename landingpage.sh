#!/bin/bash
#Installing PHP7.2
echo "Installing PHP"
yum -y install epel-release && \
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
yum -y install yum-utils && \
yum-config-manager --enable remi-php72 && \
yum -y update && \
yum -y install php && \
yum -y install php-fpm php-gd php-json php-mbstring php-mysqlnd php-xml php-xmlrpc php-opcache >> /dev/null 2>&1
echo "Starting PHP"
systemctl start php-fpm >> /dev/null 2>&1
echo "PHP started"
echo "Installing Redis"
sudo yum install redis -y >> /dev/null 2>&1
sudo systemctl enable redis
echo "Starting redis"
sudo systemctl start redis.service
echo "Redis started"
echo "Installing Composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" >> /dev/null 2>&1
php composer-setup.php --install-dir=/usr/local/bin --filename=composer >> /dev/null 2>&1
php –r “unlink(‘composer-setup.php’);” >> /dev/null 2>&1
echo "Composer is installed"
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash - >> /dev/null 2>&1
sudo yum install nodejs -y >> /dev/null 2>&1
mkdir -p /srv/code_folder/public