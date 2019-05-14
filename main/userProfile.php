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
		if (mysqli_num_rows($result) == 1) {
			$user_info = mysqli_fetch_assoc($result);
			while (strlen($user_info['image']) < 5)
				$user_info['image'] = '0' . $user_info['image'];
		} else {
			mysqli_close($link);
			header('Location: error.php?error_code=101');
			exit(0);
		}
	}
	$smarty->assign('user_info', $user_info);

	if (!isset($_GET['show']) || empty($_GET['show']))
		$_GET['show'] = 'predict';
	$show = $_GET['show'];

	if ($show == 'predict') {
		// Get classes & categories
		$sql = "SELECT `id`, `name` FROM `Class` WHERE `id` = 2 OR `id` = 3 OR `id` = 7 ORDER BY `id`";
		$classes = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$classes[] = $row;
		}
		$sql = "SELECT `id`, `name`, `class_id` FROM `Category` WHERE 1";
		$categories = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$categories[] = $row;
		}
		$smarty->assign('classes', $classes);
		$smarty->assign('categories', $categories);

		// Get category id
		if (!isset($_GET['category_id']) || empty($_GET['category_id']))
			$_GET['category_id'] = 7;
		$category_id = $_GET['category_id'];

		// Ger user history predict
		$sql = "SELECT `game_id`, `predict`, `predict_flag` FROM `Predict` WHERE `user_id` = '" . $_GET['user_id'] . "' AND (`predict_flag` = 1 OR `predict_flag` = 2) AND `category_id` = '$category_id'";
		$history_predict = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result)) {
				$sql2 = "SELECT `game_datetime`, `h_name`, `a_name` FROM `Game` WHERE `id` = '" . $row['game_id'] . "'";
				$game_info = mysqli_fetch_assoc(mysqli_query($link, $sql2));
				$row['game_date'] = $game_info['game_datetime'];
				$row['game_home_team'] = $game_info['h_name'];
				$row['game_away_team'] = $game_info['a_name'];
				$history_predict[] = $row;
			}
		}
		$smarty->assign('history_predict', $history_predict);

		// Get bought predicts
		$predicts = array();
		$already_buy = array();
		if ($_GET['user_id'] != $_SESSION['user_id']) {
			$sql = "SELECT predict_id FROM BuyPredict WHERE user_id = '" . $_SESSION['user_id'] . "'";
			if ($result = mysqli_query($link, $sql)) {
				while ($row = mysqli_fetch_assoc($result))
					$already_buy[] = $row['predict_id'];
			}
		}

		// Get user's predicts
		$sql = "SELECT `id`, `game_id`, `predict`, `price` FROM `Predict` WHERE `user_id` = '" . $_GET['user_id'] . "' AND `predict_flag` = 0 AND `category_id` = '$category_id'";
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result)) {
				$sql2 = "SELECT `game_datetime`, `h_name`, `a_name` FROM `Game` WHERE `id` = '" . $row['game_id'] . "'";
				$game_info = mysqli_fetch_assoc(mysqli_query($link, $sql2));
				$row['game_date'] = $game_info['game_datetime'];
				$row['game_home_team'] = $game_info['h_name'];
				$row['game_away_team'] = $game_info['a_name'];
				if (array_search($row['id'], $already_buy) === false)
					$predicts[] = $row;
			}
		}
		$smarty->assign('predicts', $predicts);

		// Get user's rating
		$sql = "SELECT `failure`, `success`, `rating` FROM `Rating` WHERE `user_id` = '" . $_GET['user_id'] . "' AND `category_id` = '$category_id'";
		$result = mysqli_query($link, $sql);
		if (mysqli_num_rows($result))
			$smarty->assign('rating', mysqli_fetch_assoc($result));
	} else if ($show == 'edit') {
		if ($_GET['user_id'] != $_SESSION['user_id']) {
			mysqli_close($link);
			header('Location: error.php?error_code=103');
			exit(0);
		}
		$sql = "SELECT `id`, `username`, `password`, `nickname`, `email`, `gender`, `image` FROM User WHERE id = '" . $_SESSION['user_id'] . "'";
		$result = mysqli_query($link, $sql);
		if (mysqli_num_rows($result) != 1) {
			mysqli_close($link);
			header('Location: error.php?error_code=101');
		}
		$smarty->assign('userdata', mysqli_fetch_assoc($result));
	}
	mysqli_close($link);
	$smarty->display('userProfile.tpl');
} else {
	header('Location: error.php?error_code=104');
}
?>
