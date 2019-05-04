<?php
session_start();
$member = "Guest";
$log_status = 0;

include_once('./php/logout.php');

/* logout if not active over 15 min */
if (isset($_SESSION['user_id'])) {
	if (time() - $_SESSION['user_timestamp'] > 900) {
		logout();
	} else {
		$_SESSION['user_timestamp'] = time();
	}
}

// connect to database
$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	header('Location: error.php?error_code=102');
	exit(0);
}

if (isset($_SESSION['user_id'])) {
	$member = $_SESSION['username'];
	$log_status = 1;

	// set admin account
	if ($member === 'justin' || $member === 'toby') {
		$log_status = 2;
	}

	// get unread message ammount
	$sql = "SELECT `id` FROM `Message` WHERE `receiverId` = '" . $_SESSION['user_id'] . "' AND `readFlag` = '0'";
	if ($result = mysqli_query($link, $sql)) {
		$unreadMsg = mysqli_num_rows($result);
	} else {
		header('Location: error.php?error_code=101');
		mysqli_close($link);
		exit(0);
	}
	$smarty->assign('unreadMsg', $unreadMsg);
}

// get online user ammount
$sql = "SELECT `id` FROM `OnlineUser` WHERE 1";
if ($result = mysqli_query($link, $sql)) {
	$online_users = mysqli_num_rows($result);
} else {
	header('Location: error.php?error_code=101');
	mysqli_close($link);
	exit(0);
}

mysqli_close($link);
$smarty->assign('online_users', $online_users);
$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
?>