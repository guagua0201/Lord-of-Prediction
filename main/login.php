<?php
include_once('main.php');
include_once('isLogin.php');
require_once('./php/getIpAddress.php');
//require_once('configs/gConfig.php');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
	/* Render login page if not logged in */
	if (!$log_status)
		$smarty->display('login.tpl');
	/* Redirect to index.php if already logged in */
	else 
		header('Location: index.php');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	if (isset($_POST['username']) && !empty($_POST['username']) && isset($_POST['password']) && !empty($_POST['password'])) {
		/* Connect database */
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			header('Location: error.php?error_code=102');
			exit(0);
		}

		/* User login */
		$username = mysqli_real_escape_string($link, trim($_POST['username']));
		$password = mysqli_real_escape_string($link, trim($_POST['password']));
		$sql = "SELECT `id`, `username`, `status` FROM `User` WHERE `username` = '$username' AND `password` = '$password'";
		if ($result = mysqli_query($link, $sql)) {
			if (mysqli_num_rows($result) != 1) {
				header('Location: login.php?status=1');
			} else {
				$user_info = mysqli_fetch_assoc($result);
				if ($user_info['status'] == 'N') {
					header('Location: login.php?status=2');
					exit(0);
				}

				/* Successful login */
				// add status to session
				$_SESSION['user_id'] = $user_info['id'];
				$_SESSION['username'] = $user_info['username'];
				$_SESSION['user_timestamp'] = time();

				/* search for existing data */
				$sql2 = "SELECT `id` FROM `OnlineUser` WHERE `user_id` = '" . $_SESSION['user_id'] . "'";
				$online_user_id = -1;
				if ($result = mysqli_query($link, $sql2)) {
					if (mysqli_num_rows($result) == 1)
						$online_user_id = mysqli_fetch_assoc($result)['id'];
				} else {
					header('Location: error.php?error_code=101');
					mysqli_close($link);
					exit(0);
				}
// 
				$real_ip = get_ip_address();
				if ($online_user_id === -1) {
					// insert into online-users
					$sql2 = "INSERT INTO `OnlineUser` (`user_id`, `ip_address`) VALUES ('" . $_SESSION['user_id'] . "', '$real_ip')";
					if (!mysqli_query($link, $sql2)) {
						header('Location: error.php?error_code=101');
						mysqli_close($link);
						exit(0);
					}
				} else {
					// update online-users
					$sql2 = "UPDATE `OnlineUser` SET `ip_address` = '$real_ip' WHERE `id` = '$online_user_id'";
					if (!mysqli_query($link, $sql2)) {
						header('Location: error.php?error_code=101');
						mysqli_close($link);
						exit(0);
					}
				}

				// redirect to index page
				header('Location: index.php');
			}
		} else {
			header('Location: error.php?error_code=101');
		}
		mysqli_close($link);
	}
}
// if (!$log_status) {
// 	//$smarty->assign('loginUrl', $gClient->createAuthUrl());
// 	$smarty->display('login.tpl');
// 	if (isset($_POST['submit'])) {
// 		$link = mysqli_connect(db_host, db_user, db_password, db_name);
// 		if (!$link) {
// 			die('Connection failed ' . mysqli_connect_error());
// 		}
// 		$username = mysqli_real_escape_string($link, trim($_POST['username']));
// 		$password = mysqli_real_escape_string($link, trim($_POST['password']));

// 		if (!empty($username) && !empty($password)) {
// 			// $sql = "SELECT id, username FROM User WHERE username = '$username' AND " . "password = SHA('$password')";
// 			$sql = "SELECT `id`, `username`, `status` FROM `User` WHERE `username` = '$username' AND `password` = '$password'";
// 			$data = mysqli_query($link, $sql);
// 			if (mysqli_num_rows($data) == 1) {
// 				$row = mysqli_fetch_array($data);
// 				if ($row['status'] == 'A') {
// 					mysqli_close($link);
// 				}
// 				$_SESSION['user_id'] = $row['id'];
// 				$_SESSION['username'] = $row['username'];
// 				mysqli_close($link);
// 				header('Location: index.php');
// 			} else {
// 				mysqli_close($link);
// 				header('Location: login.php');
// 			}
// 		} else {
// 			mysqli_close($link);
// 			header('Location: login.php');
// 		}
// 	}
// } else {
// 	header('Location: index.php');
// }

?>