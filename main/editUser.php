<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status === 2) {
	if (isset($_GET['id']) && !empty($_GET['id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		$sql = "SELECT * FROM User WHERE id = '" . $_GET['id'] . "'";
	//	echo $sql;
		$result = mysqli_query($link, $sql);
		$row = mysqli_fetch_assoc($result);
		$smarty->assign('row', $row);
		$smarty->display('editUser.tpl');
		if (isset($_POST['edit_user_submit'])) {
			$user_id = $_GET['id'];
			$username = mysqli_real_escape_string($link, trim($_POST['username']));
			$password = mysqli_real_escape_string($link, trim($_POST['password']));
			$nickname = mysqli_real_escape_string($link, trim($_POST['nickname']));
			$email = mysqli_real_escape_string($link, trim($_POST['email']));
			$money = mysqli_real_escape_string($link, trim($_POST['money']));
			$gender = $_POST['gender'];

			if (!empty($username) && !empty($password) && !empty($nickname) && !empty($email) && !empty($money)) {
				$sql2 = "UPDATE User SET username = '$username', password = '$password', nickname = '$nickname', email = '$email', gender = b'$gender', `money` = '$money' WHERE id = '$user_id'";
				// echo $sql2;
				mysqli_query($link, $sql2);
				mysqli_close($link);
				header('Location: /listUser.php');
			} else {
				mysqli_close($link);
				header('Location: /listUser.php');
			}
		}
	} else {
		header('Location: /listUser.php');
	}
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>