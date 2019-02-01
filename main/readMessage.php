<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	if (isset($_POST['id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		mysqli_set_charset($link, 'utf8');

		$sql = "UPDATE Message SET readFlag = '1' WHERE id = '" . $_POST['id'] . "'";
		mysqli_query($link, $sql);
		mysqli_close($link);
	}
} else {
	$smarty->assign('error', 'Permission Denied !');
	$smarty->display('error.tpl');
}
?>