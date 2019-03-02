<?php
include_once('main.php');
include_once('isLogin.php');

if (isset($_POST['user_id']) && isset($_POST['predict_id'])) {
	if ($_POST['user_id'] !== $_SESSION['user_id']) {
		$smarty->assign('error', 'Session expired!');
		$smarty->display('error.tpl');
	} else {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die("Connection failed " . mysqli_connect_error());
		}

		$sql = "SELECT `money` FROM User WHERE id = '" . $_POST['user_id'] . "'";
		if ($result = mysqli_query($link, $sql))
			$user_info = mysqli_fetch_assoc($result);

		$sql2 = "SELECT `price` FROM Predict WHERE id = '" . $_POST['predict_id'] . "'";
		if ($result = mysqli_query($link, $sql2))
			$predict_info = mysqli_fetch_assoc($result);

		if ($user_info['money'] >= $predict_info['price']) {
			$left = $user_info['money'] - $predict_info['price'];
			$sql3 = "UPDATE User SET `money` = '$left' WHERE id = '" . $_POST['user_id'] . "'";
			mysqli_query($link, $sql3);
			$sql4 = "INSERT INTO BuyPredict (user_id, predict_id) VALUES ('" . $_POST['user_id'] . "', '" . $_POST['predict_id'] . "')";
			mysqli_query($link, $sql4);
			echo 'true';
		} else {
			echo 'false';
		}
	}
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>