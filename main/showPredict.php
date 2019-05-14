<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		throw_error("300", mysqli_connect_error());
	}
	mysqli_set_charset($link, 'utf8');

	// Get classes & categories
	$sql = "SELECT `id`, `name` FROM `Class` WHERE `id` = 2 OR `id` = 3 OR `id` = 7 ORDER BY `id`";
	$classes = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result))
			$classes[] = $row;
	} else {
		throw_error("301", "");
	}
	$sql = "SELECT `id`, `name`, `class_id` FROM `Category` WHERE 1";
	$categories = array();
	if ($result = mysqli_query($link, $sql2)) {
		while ($row = mysqli_fetch_assoc($result))
			$categories[] = $row;
	} else {
		throw_error("301", "");
	}
	$smarty->assign('classes', $classes);
	$smarty->assign('categories', $categories);

	// Get category id
	if (!isset($_GET['category_id']) || empty($_GET['category_id']))
		$_GET['category_id'] = 27;
	$category_id = $_GET['category_id'];

	// Get predicts
	$sql = "SELECT `predict_id` FROM `BuyPredict` WHERE `user_id` = '" . $_SESSION['user_id'] . "'";
	$predicts = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result)) {
			$sql2 = "SELECT `user_id`, `game_id`, `predict`, `predict_flag` FROM `Predict` WHERE `id` = '" . $row['predict_id'] . "' AND `category_id` = '$category_id'";
			if ($result2 = mysqli_query($link, $sql2)) {
				$row2 = mysqli_fetch_assoc($result2);
				$sql3 = "SELECT `date`, `home_team`, `away_team` FROM `Game` WHERE `id` = '" . $row2['game_id'] . "'";
				$game_info = mysqli_fetch_assoc(mysqli_query($link, $sql3));
				$row2['game_date'] = $game_info['date'];
				$row2['game_home_team'] = $game_info['home_team'];
				$row2['game_away_team'] = $game_info['away_team'];
				$sql3 = "SELECT id, nickname FROM User WHERE id = '" . $row2['user_id'] . "'";
				$predicter_info = mysqli_fetch_assoc(mysqli_query($link, $sql3));
				$row2['predicter_nickname'] = $predicter_info['nickname'];
				$row2['predicter_id'] = $predicter_info['id'];
				$predicts[] = $row2;
			} else {
				throw_error("301", "");
			}
		}
	} else {
		throw_error("301", "");
	}

	mysqli_close($link);
	$smarty->assign('predicts', $predicts);
	$smarty->display('showPredict.tpl');
} else {
	$smarty->assign('error', 'Session expired!');
	$smarty->display('error.tpl');
}
?>
