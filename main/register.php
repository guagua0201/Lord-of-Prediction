<?php
include_once('main.php');
include_once('isLogin.php');

if ($_SERVER['REQUEST_METHOD'] === 'GET'){
	if ($log_status == 0) {
		$smarty->display('register.tpl');
	} else {
		header('Location: index.php');
	}
} else {
	if (isset($_POST['check_type'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			header('error.php?error_code=106');
		}
		if ($_POST['check_type'] == 'username') {
			$username = mysqli_real_escape_string($link, trim($_POST['username-check']));
			$sql = "SELECT id FROM User WHERE `username` = '$username'";
			if ($result = mysqli_query($link, $sql)) {
				if (mysqli_num_rows($result) != 0) {
					echo json_encode([
						"status" => "false"
					]);
				} else {
					echo json_encode([
						"status" => "true"
					]);
				}
			}
		} else if ($_POST['check_type'] == 'email') {
			$email = mysqli_real_escape_string($link, trim($_POST['email-check']));
			$sql = "SELECT id FROM User WHERE `email` = '$email'";
			if ($result = mysqli_query($link, $sql)) {
				if (mysqli_num_rows($result) != 0) {
					echo json_encode([
						"status" => "false"
					]);
				} else {
					echo json_encode([
						"status" => "true"
					]);
				}
			}
		} else if ($_POST['check_type'] == 'nickname') {
			$nickname = mysqli_real_escape_string($link, trim($_POST['nickname-check']));
			$sql = "SELECT id FROM User WHERE `nickname` = '$nickname'";
			if ($result = mysqli_query($link, $sql)) {
				if (mysqli_num_rows($result) != 0) {
					echo json_encode([
						"status" => "false"
					]);
				} else {
					echo json_encode([
						"status" => "true"
					]);
				}
			}
		}
	}
}


/* Old 
if (!$log_status) {
	if (isset($_GET['gRegister']) && $_GET['gRegister'] == 1) {
		$smarty->assign('email', $_SESSION['email']);
		$smarty->assign('nickname', $_SESSION['nickname']);
		unset($_SESSION['name']);
	}
	$smarty->display('register.tpl');
	if (isset($_POST['submit'])) {
		
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		mysqli_set_charset($link, "utf8");

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

*/

?>