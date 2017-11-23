#!/bin/sh

version="4.0.8"  # 別のバージョンを使用する場合はここを変更する

curl -o /var/www/basercms-${version}.zip https://basercms.net/packages/download/basercms/${version}
unzip /var/www/basercms-${version}.zip -d /var/www
rm -rf /var/www/html
ln -s /var/www/basercms /var/www/html
chmod go+w /var/www/basercms/app/Config
chmod go+w /var/www/basercms/app/Plugin
chmod go+w /var/www/basercms/app/tmp
chmod go+w /var/www/basercms/app/View/Pages
chmod go+w /var/www/basercms/files
chmod go+w /var/www/basercms/theme
chmod go+w /var/www/basercms/img
chmod go+w /var/www/basercms/css
chmod go+w /var/www/basercms/js
chmod go+w /var/www/basercms/app/db
