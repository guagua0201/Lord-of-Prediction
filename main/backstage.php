<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status === 2) {
	$smarty->display('backstage.tpl');	
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}

?>