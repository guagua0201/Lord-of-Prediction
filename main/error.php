<?php
include_once('main.php');
include_once('isLogin.php');

$error_code = $_GET['error_code'];
switch ($error_code) {
	case 100:
		$error_msg = 'Permission Denied!';
		break;
	case 101:
		$error_msg = 'Not Found: database';
		break;
	case 102:
		$error_msg = 'Database Connect Failed';
		break;
	case 103:
		$error_msg = 'Session Expired!';
		break;
	case 104:
		$error_msg = 'Invalid GET Require';
		break;
	default:
		$error_msg = 'Unknown';
		break;
}
$smarty->assign('error', $error_msg);
$smarty->display('error.tpl');
?>