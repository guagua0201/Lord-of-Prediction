<?php
include_once('main.php');
include_once('isLogin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
$smarty->display('index.tpl');
?>
