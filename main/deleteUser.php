<?php
include_once('main.php');
include_once('isAdmin.php');

if ($is_admin) {
	if (isset($_GET['id']) && !empty($_GET['id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}

		$sql = "DELETE FROM User WHERE id='" . $_GET['id'] . "'";
		mysqli_query($link, $sql);
		mysqli_close($link);
		header('Location: /listUser.php');
	}
} else {
	$smarty->assign('member', $member);
	$smarty->assign('log_status', $log_status);
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>