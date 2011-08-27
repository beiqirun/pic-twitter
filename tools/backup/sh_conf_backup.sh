#! /bin/sh

#Backup config files!

backup_conf_dir='conf'
backup_php_conf_dir='php'
backup_mysql_conf_dir='mysql'
backup_nginx_conf_dir='nginx'

php_ini_path='/usr/local/php/lib'
php_fpm_conf_path='/usr/local/php/etc'
mysql_conf_path='/etc'
nginx_conf_path='/usr/local/nginx/conf'
nginx_site_conf_dir_path='/usr/local/nginx/conf'

php_ini_name='php.ini'
php_fpm_conf_name='php-fpm.conf'
mysql_conf_name='my.cnf'
nginx_conf_name='nginx.conf'
nginx_site_conf_dir_name='site_conf'

version_postfix="`date \"+%Y_%m_%d_%H_%M_%S\"`"

echo '========= Backup config files ========'
echo ''
echo ''

echo '---------- Init backup dir -----------'
echo ''

#create conf/
if [ ! -d $backup_conf_dir ]; then
    mkdir $backup_conf_dir
fi

#create conf/php
if [ ! -d "$backup_conf_dir/$backup_php_conf_dir" ]; then
    cd $backup_conf_dir
    echo "create $backup_conf_dir/$backup_php_conf_dir"
    echo ''
    mkdir $backup_php_conf_dir
    cd ..
fi

#create conf/mysql
if [ ! -d "$backup_conf_dir/$backup_mysql_conf_dir" ]; then
    cd $backup_conf_dir
    echo "create $backup_conf_dir/$backup_mysql_conf_dir"
    echo ''
    mkdir $backup_mysql_conf_dir
    cd ..
fi

#create conf/nginx
if [ ! -d "$backup_conf_dir/$backup_nginx_conf_dir" ]; then
    cd $backup_conf_dir
    echo "create $backup_conf_dir/$backup_nginx_conf_dir"
    echo ''
    mkdir $backup_nginx_conf_dir
    cd ..
fi

echo '----------Finished--------'
echo ''

#backup php.ini
echo "-------- Start backup $php_ini_path/$php_ini_name "

if [ -f "$backup_conf_dir/$backup_php_conf_dir/$php_ini_name" ]; then
    mv "$backup_conf_dir/$backup_php_conf_dir/$php_ini_name" "$backup_conf_dir/$backup_php_conf_dir/$php_ini_name""_$version_postfix"
fi
cp "$php_ini_path/$php_ini_name" "$backup_conf_dir/$backup_php_conf_dir"

echo '-------- Finished'
echo ''

#backup php-fpm.conf
echo "-------- Start backup $php_fpm_conf_path/$php_fpm_conf_name "

if [ -f "$backup_conf_dir/$backup_php_conf_dir/$php_fpm_conf_name" ]; then
    mv "$backup_conf_dir/$backup_php_conf_dir/$php_fpm_conf_name" "$backup_conf_dir/$backup_php_conf_dir/$php_fpm_conf_name""_$version_postfix"
fi
cp "$php_fpm_conf_path/$php_fpm_conf_name" "$backup_conf_dir/$backup_php_conf_dir"

echo '-------- Finished'
echo ''

#backup mysql---my.cnf
echo "-------- Start backup $mysql_conf_path/$mysql_conf_name "

if [ -f "$backup_conf_dir/$backup_mysql_conf_dir/$mysql_conf_name" ]; then
    mv "$backup_conf_dir/$backup_mysql_conf_dir/$mysql_conf_name" "$backup_conf_dir/$backup_mysql_conf_dir/$mysql_conf_name""_$version_postfix"
fi
cp "$mysql_conf_path/$mysql_conf_name" "$backup_conf_dir/$backup_mysql_conf_dir"

echo '-------- Finished'
echo ''

#backup nginx.conf
echo "-------- Start backup $nginx_conf_path/$nginx_conf_name "

if [ -f "$backup_conf_dir/$backup_nginx_conf_dir/$nginx_conf_name" ]; then
    mv "$backup_conf_dir/$backup_nginx_conf_dir/$nginx_conf_name" "$backup_conf_dir/$backup_nginx_conf_dir/$nginx_conf_name""_$version_postfix"
fi
cp "$nginx_conf_path/$nginx_conf_name" "$backup_conf_dir/$backup_nginx_conf_dir"

echo '-------- Finished'
echo ''

echo "$nginx_site_conf_dir_path"
#backup nginx---site_conf
echo "-------- Start backup $nginx_site_conf_dir_path/$nginx_site_conf_dir_name "

if [ -d "$backup_conf_dir/$backup_nginx_conf_dir/$nginx_site_conf_dir_name" ]; then
    mv "$backup_conf_dir/$backup_nginx_conf_dir/$nginx_site_conf_dir_name" "$backup_conf_dir/$backup_nginx_conf_dir/$nginx_site_conf_dir_name""_$version_postfix"
fi
cp -r "$nginx_site_conf_dir_path/$nginx_site_conf_dir_name" "$backup_conf_dir/$backup_nginx_conf_dir"

echo '-------- Finished'
echo ''
