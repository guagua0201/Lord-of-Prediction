<?php

//require_once('configs/config.php');

// define('APP_REAL_PATH', 'D:/gitRepo/Lord-of-Prediction/main');
define('db_host', 'localhost');
define('db_user', 'root');
define('db_password', 'Fish2828*');
define('db_name', 'main_db');

include_once('main.php');
include_once('isLogin.php');

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
    echo "console.log('oh no');";
    die('Connection failed ' . mysqli_connect_error());
}
echo "console.log('hi1');";
$member = $_SESSION['username'];
echo "console.log('$member');";
$sql = "SELECT gender FROM User WHERE username = " . $_SESSION['username'] . "'";
$user_gender = mysqli_fetch_assoc(mysqli_query($link, $sql));
$smarty->assign('user_gender', $user_gender);

mysqli_close($link);
echo "var userGender = 1;";

?>