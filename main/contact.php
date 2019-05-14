<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	// connect to database
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		throw_error("300", mysqli_connect_error());
	}
	mysqli_set_charset($link, 'utf8');

	if ($_SERVER['REQUEST_METHOD'] === 'GET') {
		$sql = "SELECT email FROM User WHERE id='" . $_SESSION['user_id'] . "'";
		$row = mysqli_fetch_array(mysqli_query($link, $sql));
		$email = $row['email'];
		$smarty->assign('email', $email);
		$smarty->display('contact.tpl');
	} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		if (isset($_POST['subject']) && !empty($_POST['subject']) && isset($_POST['message']) && !empty($_POST['message'])) {
			$user_id = $_SESSION['user_id'];
			$subject = $_POST['subject'];
			$message = mysqli_real_escape_string($link, $_POST['message']);
			$sql = "INSERT INTO Message (senderID, receiverID, subject, message, readFlag) VALUES ('$user_id', '1', '$subject', '$message', '0')";
			if (!mysqli_query($link, $sql))
				throw_error("301", "");
			mysqli_close($link);
			echo "<script type='text/javascript'>alert('成功寄出！！');location='index.php';</script>";
		} else {
			mysqli_close($link);
		}
	}

} else {
	header('Location: /login.php');
}

?>
