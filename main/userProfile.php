<?php
include_once('main.php');
include_once('isLogin.php');

if (isset($_GET['user_id']) && !empty($_GET['user_id'])) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	mysqli_set_charset($link, 'utf8');

	$user_sql = "SELECT nickname, image FROM User WHERE id = '" . $_GET['user_id'] . "'";
	if ($result = mysqli_query($link, $user_sql)) {
		$user_info = mysqli_fetch_assoc($result);
		while (strlen($user_info['image']) < 5)
			$user_info['image'] = '0' . $user_info['image'];
	} else {
		header('Location: /index.php');
	}
	$smarty->assign('user_info', $user_info);

	if (!isset($_GET['show']) || empty($_GET['show']))
		$_GET['show'] = 'predict';
	$show = $_GET['show'];

	if ($show == 'predict') {
		$sql = "SELECT id, name FROM Class WHERE id = 2 OR id = 3 OR id = 7 ORDER BY id";
		$classes = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$classes[] = $row;
		}
		$sql2 = "SELECT id, name, class_id FROM Category WHERE 1";
		$categories = array();
		if ($result = mysqli_query($link, $sql2)) {
			while ($row = mysqli_fetch_assoc($result))
				$categories[] = $row;
		}
		$smarty->assign('classes', $classes);
		$smarty->assign('categories', $categories);

		if (!isset($_GET['category_id']) || empty($_GET['category_id']))
			$_GET['category_id'] = 27;
		$category_id = $_GET['category_id'];

		$sql3 = "SELECT game_id, predict, predict_flag FROM Predict WHERE user_id = '" . $_GET['user_id'] . "' AND (predict_flag = '1' OR predict_flag = '2') AND category_id = '$category_id'";
		$history_predict = array();
		if ($result = mysqli_query($link, $sql3)) {
			while ($row = mysqli_fetch_assoc($result)) {
				$sql4 = "SELECT `date`, `home_team`, `away_team` FROM Game WHERE id = '" . $row['game_id'] . "'";
				$game_info = mysqli_fetch_assoc(mysqli_query($link, $sql4));
				$row['game_date'] = $game_info['date'];
				$row['game_home_team'] = $game_info['home_team'];
				$row['game_away_team'] = $game_info['away_team'];
				$history_predict[] = $row;
			}
		}
		$smarty->assign('history_predict', $history_predict);
	}
	$smarty->display('userProfile.tpl');
} else {
	header('Location: /index.php');
}
?>