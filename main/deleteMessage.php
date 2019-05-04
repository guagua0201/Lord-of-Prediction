<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	if (isset($_GET['message_id']) && !empty($_GET['message_id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		$sql = "DELETE FROM Message WHERE id = '" . $_GET['message_id'] . "'";
		mysqli_query($link, $sql);
		mysqli_close($link);
		header('Location: showMessage.php');
	}
} else {
	$smarty->assign('error', 'Session Expired!');
	$smarty->display('error.tpl');
}
?>