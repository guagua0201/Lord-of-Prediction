<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}

	$sql = "SELECT user_id FROM Predict WHERE id = '" . $_GET['id'] . "'";
	$user_info = mysqli_fetch_assoc(mysqli_query($link, $sql));
	if (($log_status == 1 && $user_info['user_id'] == $_SESSION['user_id']) || $log_status == 2) {
		$sql2 = "DELETE FROM Predict WHERE id = '" . $_GET['id'] . "'";
		mysqli_query($link, $sql2);
	}
	mysqli_close($link);
	header('Location: userProfile.php?user_id=' . $user_info['user_id']);
} else {
	header('Location: index.php');
}
?>