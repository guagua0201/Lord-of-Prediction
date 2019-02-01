<?php
include_once('main.php');
include_once('isLogin.php');
$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
if ($log_status != 0) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	mysqli_set_charset($link, 'utf8');
	$sql = "SELECT email FROM User WHERE id='" . $_SESSION['user_id'] . "'";
	//echo $sql;
	$row = mysqli_fetch_array(mysqli_query($link, $sql));
	$email = $row['email'];
	$smarty->assign('email', $email);
	$smarty->display('contact.tpl');

	if (isset($_POST['submit'])) {
		$user_id = $_SESSION['user_id'];
		$subject = $_POST['subject'];
	//	echo $subject;
		$message = mysqli_real_escape_string($link, $_POST['message']);
		$sql2 = "INSERT INTO Message (senderID, receiverID, subject, message, readFlag) VALUES ('$user_id', '1', '$subject', '$message', '0')";
	// 	echo $sql2;
		mysqli_query($link, $sql2);
		mysqli_close($link);
		echo "<script type='text/javascript'>alert('成功寄出！！');location='index.php';</script>";
	} else {
		mysqli_close($link);
	}
} else {
	header('Location: /login.php');
}

?>