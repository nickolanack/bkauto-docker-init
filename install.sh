
rm html/* -rf
if [ -d 'application/application' ]; then
   echo 'Fetch codeigniter repository'
   rm codeigniter -rf
   mkdir tmp
   git clone -q -b 2.2-stable https://github.com/bcit-ci/CodeIgniter.git codeigniter
   mv -f codeigniter/* tmp/
   rsync -rvq application/ tmp/
   mv tmp application/html
fi
echo 'Move application to document root'
mv application/html/* html/
cp application/html/.htaccess html/
echo 'Replace mysql primary user in config'

echo "\$db['default']['dbdriver']='mysqli';" >> html/application/config/database.php
echo "\$db['default']['username']='testuser';" >> html/application/config/database.php
echo "\$db['default']['database']='qb2014';" >> html/application/config/database.php
echo "\$db['default']['password']='duke851';" >> html/application/config/database.php

echo "\$active_record=TRUE;" >> html/application/config/database.php


echo "\$config['encryption_key'] = 'FTPCLASS';" >> html/application/config/config.php
echo "\$config['cookie_secure'] = FALSE;" >> html/application/config/config.php
echo "\$config['base_url'] = 'http://'.\$_SERVER['SERVER_NAME'].':'.\$_SERVER['SERVER_PORT'];" >> html/application/config/config.php

cp -R util/settings html/

echo 'Remove apache redirect to https directive'
cp html/.htaccess html/htaccess.bak
sed -i '8d' html/.htaccess
sed -i '8d' html/.htaccess
sed -i '8d' html/.htaccess

echo 'Override production mode detection'
sed -i 's/if (custom_/if(true||custom_/' html/index.php
sed -i 's/if(custom_/if(true||custom_/' html/index.php

chmod -R 777 html


cd /var/www/html


wget –quiet https://files.phpmyadmin.net/phpMyAdmin/4.6.1/phpMyAdmin-4.6.1-english.zip
unzip -q phpMyAdmin-4.6.1-english.zip 
mv phpMyAdmin-4.6.1-english pma