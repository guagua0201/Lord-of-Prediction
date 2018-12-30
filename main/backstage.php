<?php
include_once('main.php');
include_once('isAdmin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
if ($is_admin) {
	$smarty->display('backstage.tpl');	
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}

?>