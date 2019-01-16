<?php
include_once('main.php');
include_once('isLogin.php');
$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
if ($log_status) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	$sql = "SELECT email FROM User WHERE id='" . $_SESSION['user_id'] . "'";
	//echo $sql;
	$row = mysqli_fetch_array(mysqli_query($link, $sql));
	$email = $row['email'];
	$smarty->assign('email', $email);
}
$smarty->display('contact.tpl');
/* 
if isset($_POST['submit']) {
	...
}
*/
?>