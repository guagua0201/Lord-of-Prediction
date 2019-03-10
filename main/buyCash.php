<?php
include_once('main.php');
include_once('isLogin.php');

if (isset($_POST['buy_submit'])) {
	if ($_POST['payment-method'] == 'credit') {
		echo "<form id='credit_form' action='ecpayCreateOrder.php' method='POST'>";
		echo "<input name='price' value='" . $_POST['price'] . "' hidden>";
		echo "<input type='submit' hidden>";
		echo "</form>";
		echo "<script>";
		echo "document.getElementById('credit_form').submit();";
		echo "</script>";
	}
}

if (!isset($_GET['step']) || empty($_GET['step']))
	$_GET['step'] = 1;
$step = $_GET['step'];

if ($step == 2 && (!isset($_GET['price']) || empty($_GET['price'])))
	$step = 1;


$smarty->display('buyCash.tpl');
?>