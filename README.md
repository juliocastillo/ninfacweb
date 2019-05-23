ninfacweb
=========

A Symfony project created on July 26, 2015, 5:04 pm.


GIT IGNORED
===========
# Archivos de respaldo
*~
.*.kate-swp #kate
.*.swp #VIM
 
# Archivo de configuración de la personalización del comportamiento del directorio para KDE
.directory
 
# Bootstrap
app/bootstrap*
 
# Directorios de Symfony
vendor/*
*/logs/*
*/cache/*
web/uploads/*
web/bundles/*
 
# Archivos de configuración
app/config/parameters.ini
app/config/parameters.yml
 
#Carpeta de configuración del proyecto de NetBeans
nbproject/



apt install php-pear php-soap


php app/console cache:clear; php app/console cache:clear --env=prod; php app/console assets:install web --symlink; php app/console assets:install web --symlink --env=prod


apt-get install php5.6-xml
