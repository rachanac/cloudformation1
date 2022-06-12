#!/bin/bash
mkdir -p /home/redux/loaders.linux-x86_64/
cd /home/redux/loaders.linux-x86_64/
curl https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz --output loaders.linux-x86_64.tar.gz
tar -xvf loaders.linux-x86_64.tar.gz
cp ixed.8.0.lin /usr/lib/php/20200930
chown root:root /usr/lib/php/20200930/ixed.8.0.lin
echo 'extension=ixed.8.0.lin' >> /etc/php/8.0/apache2/php.ini
touch /etc/php/8.0/fpm/conf.d/sourceguardian.ini
echo 'zend_extension=/usr/lib/php/20200930/ixed.8.0.lin' >> /etc/php/8.0/fpm/conf.d/sourceguardian.ini
cp -pr /etc/php/8.0/fpm/conf.d/sourceguardian.ini /etc/php/8.0/cli/conf.d/
