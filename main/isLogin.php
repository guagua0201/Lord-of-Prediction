<?php
session_start();
$member = "Guest";
$log_status = 0;

/* logout if not active over 15 min */
if (isset($_SESSION['user_id'])) {
	if (time() - $_SESSION['user_timestamp'] > 900) {
		unset($_SESSION['user_id']);
		unset($_SESSION['username']);
		unset($_SESSION['user_timestamp']);
		header('Location: index.php');
	} else {
		$_SESSION['user_timestamp'] = time();
	}
}

if (isset($_SESSION['user_id'])) {
	$member = $_SESSION['username'];
	$log_status = 1;

	// set admin account
	if ($member === 'justin' || $member === 'toby') {
		$log_status = 2;
	}

	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}

	$sql = "SELECT id FROM Message WHERE receiverId = '" . $_SESSION['user_id'] . "' AND readFlag = '0'";
	$result = mysqli_query($link, $sql);
	$unreadMsg = mysqli_num_rows($result);
	mysqli_close($link);
	$smarty->assign('unreadMsg', $unreadMsg);
}
$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
?>