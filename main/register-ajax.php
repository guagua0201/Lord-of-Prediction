<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status == 0) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		header('Location: error.php?error_code=106');
	}

	$valid = true;

	if (isset($_POST['username'])) {
		$username = mysqli_real_escape_string($link, trim($_POST['username']));
		if ($username == "")
			$valid = false;
	} else {
		$valid = false;
	}
	// echo $valid;

	if (isset($_POST['nickname'])) {
		$nickname = mysqli_real_escape_string($link, trim($_POST['nickname']));
		if ($nickname == "")
			$valid = false;
	} else {
		$valid = false;
	}
	// echo $valid;

	if (isset($_POST['password'])) {
		$password = mysqli_real_escape_string($link, trim($_POST['password']));
		if ($password == "")
			$valid = false;
	} else {
		$valid = false;
	}
	// echo $valid;

	if (isset($_POST['c-password'])) {
		$c_password = mysqli_real_escape_string($link, trim($_POST['c-password']));
		if ($c_password != $password)
			$valid = false;
	} else {
		$valid = false;
	}
	// echo $valid;

	if (isset($_POST['email'])) {
		$email = mysqli_real_escape_string($link, trim($_POST['email']));
		if ($email == "" || !filter_var($email, FILTER_VALIDATE_EMAIL))
			$valid = false;
	} else {
		$valid = false;
	}
	// echo $valid;

	if (isset($_POST['gender'])) {
		$gender = $_POST['gender'];
	}

	/* Valid Registeration: Insert Data Into DB */
	if ($valid) {
		$verify_key = md5($username . date('mY'));
		$sql = "INSERT INTO User (`username`, `nickname`, `password`, `email`, `gender`, `verify_key`) VALUES ('$username', '$nickname', '$password', '$email', b'$gender', '$verify_key')";
		// echo $sql;
		if (mysqli_query($link, $sql)) {
			$sql2 = "SELECT id FROM User WHERE `username` = '$username'";
			if ($result = mysqli_query($link, $sql2))
				$user_info = mysqli_fetch_assoc($result);
			$mail_msg = "Thanks for your registeration, please click the link below to active your account\n";
			$mail_msg .= "http://" . $_SERVER['SERVER_NAME'] . "/activateUser.php?id=" . $user_info['id'] . "&key=" . $verify_key;
			$headers = "From: ProphecyKing.com";
			if(mail($email, "ProphecyKing: Activate Your Account", "$mail_msg","$headers")){
				header('register-mailed.php');
			}
			else{
				header('error.php?error_code=107');
			}
		} else {
			$valid = false;
		}
	}

	echo json_encode([
		"status" => $valid
	]);
	mysqli_close($link);
} else {
	header('Location: index.php');
}
?>