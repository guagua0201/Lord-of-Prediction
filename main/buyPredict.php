<?php
include_once('main.php');
include_once('isLogin.php');

if (isset($_POST['user_id']) && !empty($_POST['user_id']) && isset($_POST['predict_id']) && !empty($_POST['predict_id'])) {
	if ($_POST['user_id'] !== $_SESSION['user_id']) {
		throw_error("103", "");
	} else {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			throw_error("300", mysqli_connect_error());
		}

		$sql = "SELECT `money` FROM User WHERE id = '" . $_POST['user_id'] . "'";
		if ($result = mysqli_query($link, $sql)) {
			$user_info = mysqli_fetch_assoc($result);
		} else {
			throw_error("301", "");
		}

		$sql = "SELECT `price` FROM Predict WHERE id = '" . $_POST['predict_id'] . "'";
		if ($result = mysqli_query($link, $sql)) {
			$predict_info = mysqli_fetch_assoc($result);
		} else {
			throw_error("301", "");
		}

		if ($user_info['money'] >= $predict_info['price']) {
			$left = $user_info['money'] - $predict_info['price'];
			$sql = "UPDATE User SET `money` = '$left' WHERE id = '" . $_POST['user_id'] . "'";
			if (!mysqli_query($link, $sql))
				throw_error("301", "");
			$sql = "INSERT INTO BuyPredict (user_id, predict_id) VALUES ('" . $_POST['user_id'] . "', '" . $_POST['predict_id'] . "')";
			if (!mysqli_query($link, $sql))
				throw_error("301", "");
			echo 'true';
		} else {
			echo 'false';
		}
		mysqli_close($link);
	}
} else {
	throw_error('401', "");
}
?>
