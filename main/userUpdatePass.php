<?php
include_once('main.php');
include_once('isLogin.php');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
	if (isset($_GET['id']) && !empty($_GET['id']) && isset($_GET['key']) && !empty($_GET['key'])) {
		/* Connect database */
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			header('Location: error.php?error_code=102');
		}

		/* Get request params */
		$id = mysqli_real_escape_string($link, $_GET['id']);
		$key = mysqli_real_escape_string($link, $_GET['key']);

		/* Get user info */
		$sql = "SELECT `id`, `password`, `username`, `nickname` FROM `User` WHERE `id` = '$id' AND `forget_password_key` = '$key'";
		if ($result = mysqli_query($link, $sql)) {
			if (mysqli_num_rows($result) != 1) {
				mysqli_close($link);
				header('Location: error.php?error_code=101');
				exit(0);
			} else {
				$user = mysqli_fetch_assoc($result);
				$smarty->assign('user', $user);
			}
		} else {
			mysqli_close($link);
			header('Location: error.php?error_code=101');
			exit(0);
		}

		/* Render userUpdatePass.tpl */
		$smarty->display('userUpdatePass.tpl');
	} else {
		header('Location: error.php?error_code=104');
	}
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	if (isset($_POST['id']) && !empty($_POST['id']) && isset($_POST['password']) && !empty($_POST['password'])) {
		/* Connect database */
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			header('Location: error.php?error_code=102');
		}

		/* Get request post data */
		$id = mysqli_real_escape_string($link, $_POST['id']);
		$password = mysqli_real_escape_string($link, $_POST['password']);

		/* Update user info */
		$sql = "UPDATE `User` SET `password` = '$password' WHERE `id` = '$id'";
		if ($result = mysqli_query($link, $sql)) {
			echo "
				<script>
					alert('修改成功');
					window.location.href='login.php';
				</script>
			";
		} else {
			header('Location: error.php?error_code=101');
		}
		mysqli_close($link);
	} else {
		header('Location: error.php?error_code=104');
	}
}
?>