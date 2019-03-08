<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status == 2) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqi_connect_error());
	}
	mysqli_set_charset($link, 'utf8');

	$sql = "SELECT id, name, description, class_id FROM Category WHERE 1";
	$categories = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result))
			$categories[] = $row;
	}

	$sql2 = "SELECT id, name FROM Class WHERE 1";
	$classes = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result))
			$classes[] = $row;
	}

	$smarty->assign('categories', $categories);
	$smarty->assign('classes', $classes);
	$smarty->display('listCategory.tpl');
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>