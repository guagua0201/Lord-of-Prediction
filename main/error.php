<?php
include_once('main.php');
// include_once('isLogin.php');

$error_code = 999;
if (isset($_GET['error_code']) && !empty($_GET['error_code']))
	$error_code = $_GET['error_code'];

$custom_msg = "";
if (isset($_GET['msg']) && !empty($_GET['msg']))
	$custom_msg = $_GET['msg'];

// 1 -> 
// 2 ->
// 3 -> database
// 4 -> request
// 5 -> server
// 6 ->
// 7 ->
// 8 ->
// 9 ->

switch ($error_code) {
	case 401:
	case 100:
		$error_msg = 'permission denied';
		break;
	case 101:
	case 301:
		$error_msg = 'database query failed';
		break;
	case 102:
	case 300:
		$error_msg = 'database connection failed';
		break;
	case 103:
		$error_msg = 'session expired';
		break;
	case 104:
	case 404:
		$error_msg = 'bad request';
		break;
	case 406:
		$error_msg = 'missing field';
	case 107:
		$error_msg = 'register failed';
	default:
		$error_msg = 'unknown error occur';
		break;
}
$smarty->assign('error', $error_msg);
$smarty->assign('msg', $custom_msg);
$smarty->display('error.tpl');
?>
