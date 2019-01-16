<?php
include_once('main.php');
include_once('isLogin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
if ($log_status === 2) {
	$smarty->display('backstage.tpl');	
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}

?>