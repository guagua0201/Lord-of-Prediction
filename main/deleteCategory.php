<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status == 2) {
	if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}

		$sql = "DELETE FROM Category WHERE id = '" . $_GET['category_id'] . "'";
		mysqli_query($link, $sql);
		mysqli_close($link);
		header('Location: listCategory.php');
	}
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>