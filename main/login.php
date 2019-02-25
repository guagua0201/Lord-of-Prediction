<?php
include_once('main.php');
include_once('isLogin.php');
//require_once('configs/gConfig.php');

$error_message = '';

if (!$log_status) {
	//$smarty->assign('loginUrl', $gClient->createAuthUrl());
	$smarty->display('login.tpl');
	if (isset($_POST['submit'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		$username = mysqli_real_escape_string($link, trim($_POST['username']));
		$password = mysqli_real_escape_string($link, trim($_POST['password']));

		if (!empty($username) && !empty($password)) {
			// $sql = "SELECT id, username FROM User WHERE username = '$username' AND " . "password = SHA('$password')";
			$sql = "SELECT id, username FROM User WHERE username = '$username' AND password = '$password'";
			$data = mysqli_query($link, $sql);
			if (mysqli_num_rows($data) == 1) {
				$row = mysqli_fetch_array($data);
				$_SESSION['user_id'] = $row['id'];
				$_SESSION['username'] = $row['username'];
				mysqli_close($link);
				header('Location: ./index.php');
			} else {
				mysqli_close($link);
				header('Location: ./login.php');
			}
		} else {
			mysqli_close($link);
			header('Location: ./login.php');
		}
	}
} else {
	header('Location: /index.php');
}

?>