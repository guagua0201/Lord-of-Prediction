<?php

include_once('../main.php');
include_once('../isLogin.php');
$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die('Connection failed ' . mysqli_connect_error());
}
?>
