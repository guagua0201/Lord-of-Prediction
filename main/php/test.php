<?php
include_once('../main.php');
include_once('../isLogin.php');

echo $log_status;
$smarty->assign('log_status', $log_status);
$smarty->display('test.tpl');
?>