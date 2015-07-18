<?php
error_reporting(0);
$db  = 'mysql';
$db_user = 'root';
$db_pass = 'khubab';
$host = 'localhost';
$con = mysql_connect($host, $db_user, $db_pass);
if (!$con) {
    die('Not connected : ' . mysql_error());
}
$db_selected = mysql_select_db($db, $con);
if (!$db_selected) {
    die ('Couldn\'t connect to database.. <br><br> : ' . mysql_error());
}
?>

