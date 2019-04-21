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
			$sql = "SELECT `id` FROM `User` WHERE `email` = '$email'";
			if ($result = mysqli_query($link, $sql)) {
				if ($_POST['type'] == 'check-exist') {
					if (mysqli_num_rows($result) == 1) {
						echo json_encode([
							"status" => "true"
						]);
					} else {
						echo json_encode([
							"status" => "false"
						]);
					}
				} else if ($_POST['type'] == 'success') {
					if (mysqli_num_rows($result) != 1) {
						echo json_encode([
							"status" => 'false'
						]);
					} else {
						$forgetPassKey = md5(time() . $email);
						$user_id = mysqli_fetch_assoc($result)['id'];
						$sql2 = "UPDATE `User` SET `forget_password_key` = '$forgetPassKey' WHERE `id` = '$user_id'";
						if (!mysqli_query($link, $sql2)) {
							header('error.php?error_code=101');
							mysqli_close($link);
							exit(0);
						}
						$mail_msg = 'Please click below link to reset your password!\n';
						$mail_msg .= "http://" . $_SERVER['SERVER_NAME'] ."/userUpdatePass.php?id=" . $user_id . "&key=" . $forgetPassKey;
						$headers = "From: ProphecyKing.com";
						if (mail($email, "ProphecyKing: Reset Your Password", $mail_msg, $headers)) {
							echo json_encode([
								"status" => 'true'
							]);
						} else {
							echo json_encode([
								"status" => 'false'
							]);
						}
					}
				}
			}
		}
		mysqli_close($link);
	}
}
?>