<?php
include_once('main.php');
include_once('isLogin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

if (!$log_status) {
	$smarty->display('register.tpl');
	if (isset($_POST['submit'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}

		$username = mysqli_real_escape_string($link, trim($_POST['username']));
		$password = mysqli_real_escape_string($link, trim($_POST['password']));
		$nickname = mysqli_real_escape_string($link, trim($_POST['nickname']));
		$email = mysqli_real_escape_string($link, trim($_POST['email']));
		$gender = $_POST['gender'];

		// maybe check something else!!
		// Check Duplicate username
		// Email Check
		if (!empty($username) && !empty($password) && !empty($nickname) && !empty($email)) {
			$sql = "INSERT INTO User (username, password, nickname, email, gender) VALUES ('$username', '$password', '$nickname', '$email', b'$gender')";
			//echo $sql;
			mysqli_query($link, $sql);
			$sql2 = "SELECT id, username FROM User WHERE username = '$username'";
		//	echo $sql2;
			$data = mysqli_query($link, $sql2);
			$row = mysqli_fetch_array($data);
			mysqli_close($link);
			$_SESSION['user_id'] = $row['id'];
			$_SESSION['username'] = $row['username'];
			header('Location: /index.php');
		} else {
			mysqli_close($link);
			header('Location: /register.php');
		}
	}
} else {
	header('Location: /index.php');
}
?>