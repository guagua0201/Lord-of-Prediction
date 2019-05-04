<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	if (isset($_GET['id']) && !empty($_GET['id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		$sql = "SELECT * FROM User WHERE id = '" . $_GET['id'] . "'";
	//	echo $sql;
		if ($log_status == 2) {
			$result = mysqli_query($link, $sql);
			$row = mysqli_fetch_assoc($result);
			$smarty->assign('row', $row);
			$smarty->display('editUser.tpl');
		}
		if (isset($_POST['edit_user_submit'])) {
			$user_id = $_GET['id'];
			$username = mysqli_real_escape_string($link, trim($_POST['username']));

			$password = mysqli_real_escape_string($link, trim($_POST['password']));
			if (isset($_POST['old-password']))
				$old_password = $_POST['old-password'];
			if ($old_password != $password) {
				mysqli_close($link);
				header('Location: error.php?error_code=105');
			}
			$new_password = mysqli_real_escape_string($link, trim($_POST['new-password']));
			$rep_password = mysqli_real_escape_string($link, trim($_POST['rep-password']));
			if (isset($new_password) && !empty($new_password)) {
				if (isset($rep_password) && $new_password == $rep_password) {
					$password = $new_password;
				} else {
					mysqli_close($link);
					header('Location: error.php');
				}
			}

			$nickname = mysqli_real_escape_string($link, trim($_POST['nickname']));
			$email = mysqli_real_escape_string($link, trim($_POST['email']));
			$money = mysqli_real_escape_string($link, trim($_POST['money']));
			$gender = $_POST['gender'];

			// echo $username . '&' . $password . '&' . $nickname . '&' . $email . '&' . $money;

			if (!empty($username) && !empty($password) && !empty($nickname) && !empty($email) && !empty($money)) {
				$sql2 = "UPDATE User SET username = '$username', password = '$password', nickname = '$nickname', email = '$email', gender = b'$gender', `money` = '$money' WHERE id = '$user_id'";
				// echo $sql2;
				mysqli_query($link, $sql2);
				mysqli_close($link);
				header('Location: index.php');
			} else {
				mysqli_close($link);
				// echo "HI";
				header('Location: error.php');
			}
		}
	} else {
		header('Location: error.php?error_code=104');
	}
} else {
	header('Location: error.php?error_code=100');
}
?>