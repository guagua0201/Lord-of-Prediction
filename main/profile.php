<?php
include_once('main.php');
include_once('isLogin.php');
if (!$log_status) {
    header("Location: login.php"); 
    exit;
}
else{
    $smarty->display('profile.tpl');
}
?>