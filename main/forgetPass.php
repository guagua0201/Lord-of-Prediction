<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	header('Location: index.php');
} else {
	if ($_SERVER['REQUEST_METHOD'] === 'GET') {
		$smarty->display('forgetPass.tpl');
	}
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {

	}
}
?>