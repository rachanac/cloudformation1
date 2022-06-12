#!/bin/bash
mkdir -p /home/redux/loaders.linux-x86_64/
cd /home/redux/loaders.linux-x86_64/
curl https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz --output loaders.linux-x86_64.tar.gz
tar -xvf loaders.linux-x86_64.tar.gz
cp ixed.7.1.lin /usr/lib/php/20160303
chown root:root /usr/lib/php/20160303/ixed.7.1.lin
echo 'extension=ixed.7.1.lin' >> /etc/php/7.1/apache2/php.ini
touch /etc/php/7.1/fpm/conf.d/sourceguardian.ini
echo 'zend_extension=/usr/lib/php/20160303/ixed.7.1.lin' >> /etc/php/7.1/fpm/conf.d/sourceguardian.ini
cp -pr /etc/php/7.1/fpm/conf.d/sourceguardian.ini /etc/php/7.1/cli/conf.d/
