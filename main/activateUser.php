<?php
include_once('main.php');
include_once('isLogin.php');

if (is_numeric($_GET['id']) && isset($_GET['key'])) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		throw_error("300", mysqli_connect_error());
	}
	$sql = "SELECT id FROM User WHERE `id` = '" . $_GET['id'] . "' AND `status` = 'N' AND `verify_key` = '" . $_GET['key'] . "'";
	if ($result = mysqli_query($link, $sql)) {
		if (mysqli_num_rows($result) == 1) {
			$user_id = mysqli_fetch_assoc($result)['id'];
			$sql2 = "UPDATE User SET `status` = 'A' WHERE `id` = '$user_id'";
			if (mysqli_query($link, $sql2)) {
				$smarty->assign('success', true);
			} else {
				throw_error("301", "");
			}
		} else {
			$smarty->assign('success', false);
		}
	} else {
		throw_error("301", "");
	}
	$smarty->display('activateUser.tpl');
} else {
	throw_error("404", "");
}
?>
