<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	header('Location: index.php');
} else {
	if ($_SERVER['REQUEST_METHOD'] === 'GET') {
		$smarty->display('forgetPass.tpl');
	}
	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			header('error.php?error_code=106') and die();
		}

		if (isset($_POST['type'])) {
			$email = mysqli_real_escape_string($link, trim($_POST['email']));
			if ($_POST['type'] == 'check-exist') {
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
			} else if ($_POST['type'] == 'success') {
				
			}
		}
	}
}
?>