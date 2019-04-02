<?php
include_once('main.php');
include_once('isLogin.php');

if (isset($_GET['error_code']))
	$error_code = $_GET['error_code'];
else
	$error_code = 999;
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
	case 105:
		$error_msg = 'Password Wrong!';
		break;
	case 106:
		$error_msg = 'Database Connection Failed!';
	default:
		$error_msg = 'Unknown';
		break;
}
$smarty->assign('error', $error_msg);
$smarty->display('error.tpl');
?>