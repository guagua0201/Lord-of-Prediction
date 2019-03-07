<?php
include_once('main.php');
include_once('isLogin.php');

if (!isset($_GET['step']) || empty($_GET['step']))
	$_GET['step'] = 1;
$step = $_GET['step'];

if ($step == 1) {

} else if ($step == 2) {

}

$smarty->display('buyCash.tpl');
?>