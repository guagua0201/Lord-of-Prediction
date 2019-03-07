<?php
include_once('main.php');
include_once('isLogin.php');

if (!isset($_GET['step']) || empty($_GET['step']))
	$_GET['step'] = 1;
$step = $_GET['step'];

if ($step == 2 && (!isset($_GET['price']) || empty($_GET['price'])))
	$step = 1;

$smarty->display('buyCash.tpl');
?>