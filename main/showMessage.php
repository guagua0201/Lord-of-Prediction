<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	mysqli_set_charset($link, "utf8");

	$user_id = $_SESSION['user_id'];
	$sql = "SELECT * FROM Message WHERE receiverId = '$user_id'";
	$data = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result)) {
			$sql2 = "SELECT username, nickname FROM User WHERE id = '" . $row['senderId'] . "'";
			$user_data = mysqli_fetch_assoc(mysqli_query($link, $sql2));
			$row['senderUsername'] = $user_data['username'];
			$row['senderNickname'] = $user_data['nickname'];
			$data[] = $row;
		}
	}
	$smarty->assign('data', $data);
	$smarty->display('showMessage.tpl');
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>