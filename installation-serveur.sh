#!/bin/sh
echo "*********************************************"
echo "*  Bienvenue dans le script d'installation  *"
echo "*********************************************"
echo " "
read -p "appuyez sur entrée pour lancer l'installation"


installPHP()
{
  # installation php 7.4
  sudo apt-get install -y php7.4
  sudo apt-get install -y php7.4-common
  sudo apt-get install -y php7.4-cli
  sudo apt-get install -y php7.4-mysql
  sudo apt-get install -y libapache2-mod-php7.4
  sudo apt-get install -y php7.4-mbstring
  sudo apt-get install -y php7.4-json
  sudo apt-get install -y php7.4-xml
  sudo apt-get install -y php7.4-xdebug
  sudo service apache2 restart
}
configurePHP()
{
  sudo php -r "\$ini=glob('/etc/php/*/apache2/php.ini')[0]; \$buffer=file_get_contents(\$ini); \$buffer=str_replace('display_errors = Off', 'display_errors = On',\$buffer); file_put_contents(\$ini, \$buffer);";
  sudo service apache2 restart
}

installPHP
configurePHP



exit 0
