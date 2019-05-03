<?php
include_once('main.php');
include_once('isLogin.php');

if (isset($_GET['error_code']) && !empty($_GET['error_code']))
	$error_code = $_GET['error_code'];
else
	$error_code = 999;
switch ($error_code) {
	case 100:
		$error_msg = 'Permission Denied';
		break;
	case 101:
		$error_msg = 'database query failed';
		break;
	case 102:
		$error_msg = 'database connection failed';
		break;
	case 103:
		$error_msg = 'Session Expired';
		break;
	case 104:
		$error_msg = 'Bad Request';
		break;
	case 107:
		$error_msg = 'register failed';
	default:
		$error_msg = 'unknown error occur';
		break;
}
$smarty->assign('error', $error_msg);
$smarty->display('error.tpl');
?>