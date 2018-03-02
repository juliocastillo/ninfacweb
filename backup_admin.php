<?php
/*
 * Software para respaldos
 * Autor Julio Castillo, 12-12-2017
 * Versión 1.0, cron linux o tareas win
 * crear ruta backups y logs
 */
include('config_backup_admin.php');
$now 		= new DateTime();
$logsPath 	= $logs_path.'\respaldos_'.date("m-Y");
$fileName 	= $backups_path.'\bak_'.date("d-m-Y").'.sql';
$dump		= "dbname=postgresql://$user:$password@$host:$port/$database";
//var_dump($fileName); exit();
try {
	print $output = shell_exec("pg_dump --$dump > $fileName");
	file_put_contents($logsPath.'.log', ">Respaldo exitoso de fecha: ".$now->format('d/m/Y H:i:s').".\n", FILE_APPEND);
} catch (\Exception $e) {
	file_put_contents( $logsPath.'.err', $e->__toString(), FILE_APPEND );
}
