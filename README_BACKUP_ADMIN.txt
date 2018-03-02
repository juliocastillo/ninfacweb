1) crear carpeta para alojar logs 
$ mkdir logs

2) crear carpeta para alojar backups
$ mkdir backups

3) modificar archivo config_backup_admin.php con los parametros del servidor de base de datos.
$host = 'hostname';
$port = 'port';
$database = 'database name';
$user = 'user name';
$password = 'user password';
$backups_path = 'route backups';
$logs_path = 'route_logs';

4) crear tarea programada o cron para que ejecute el archivo
$ php backup_admin.php

5) Poner en ruta la carpeta /bin de posrgres para acceder al pg_dump