<?php
include_once('main.php');
include_once('isLogin.php');


/* GET */
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
	/* Link MySQL */
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link)
		header('Location: error.php?error_code=102');
	mysqli_set_charset($link, "utf8");

	/* Date setup */
	$smarty->assign('yesterday', strtotime("-1 day"));
	$smarty->assign('tomorrow', strtotime("+1 day"));


	/* Collect all classes and categories */
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

	/* Read predict data */
	if (!isset($_GET['category_id']) || empty($_GET['category_id']))
		$_GET['category_id'] = '7';
	$id = $_GET['category_id'];
	$data = array();
	$names = array();
	$indexes = array();
	$filename=  './documents/predictGame/' . $id . '.json';

	if (file_exists($filename) && ($json = file_get_contents($filename)) !== false) {
		$json_data = json_decode($json, true);

		/* Insert unknown game into DB */
		foreach ($json_data as $game) {
			$game_datetime = date("Y") . '-' . $game['date'] . ' ' . $game['time'];
			$h_name = $game['h_name'];
			$a_name = $game['a_name'];
			$details = json_encode($game['details']);
			$sql = "SELECT id FROM Game WHERE `game_datetime` = '$game_datetime' AND `h_name` = '$h_name' AND `a_name` = '$a_name' AND `category_id` = '$id'";
			if (($result = mysqli_query($link, $sql)) && mysqli_num_rows($result) == 0) {
				$sql2 = "INSERT INTO `Game` (`category_id`, `game_datetime`, `h_name`, `a_name`, `details`) VALUES ('$id', '$game_datetime', '$h_name', '$a_name', '$details')";
				$result = mysqli_query($link, $sql2);
			}
		}
	}

	/*
	foreach ($data as $game) {
		$date = $game[$indexes['比賽時間']];
		$time = $game[$indexes['比賽時間'] + 1];
		$home_team = $game[$indexes['主客隊'] + 1];
		$away_team = $game[$indexes['主客隊']];
		$sql3 = "SELECT id FROM Game WHERE `date` = '$date' AND `time` = '$time' AND `home_team` = '$home_team' AND `away_team` = '$away_team' AND `category_id` = '$id'";
		$result = mysqli_query($link, $sql3);
		if (mysqli_num_rows($result) == 0) {
			$sql4 = "INSERT INTO Game (`category_id`, `date`, `time`, `home_team`, `away_team`) VALUES ('$id', '$date', '$time', '$home_team', '$away_team')";
			// echo $sql4;
			mysqli_query($link, $sql4);
			$result = mysqli_query($link, $sql3);
		}
		$gameid = mysqli_fetch_assoc($result);
		$game_id[] = $gameid['id'];
	}
	*/

	/* Get All Unfinished Games */
	$sql = "SELECT `id`, `game_datetime`, `h_name`, `a_name`, `details` FROM `Game` WHERE `game_flag` = '0' AND `category_id` = '$id'";
	$data = array();
	$names = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result)) {
			$row['details'] = json_decode($row['details'], true);
			$data[] = $row;
			// print_r($row); echo "<br>";
		}
		if (count($data) > 0) {
			foreach (array_keys($data[0]['details']) as $name) {
				if ($name == 'handicap')
					$names[] = '讓分';
				else if ($name == 'total')
					$names[] = '大小';
				else if ($name == 'single')
					$names[] = '獨贏';
				else if ($name == 'one_lose_two_win')
					$names[] = '一輸二贏';
				else if ($name == 'odd_even')
					$names[] = '單雙';
			}
		}
	}
	$smarty->assign('data', $data);
	$smarty->assign('names', $names);

	mysqli_close($link);
	$smarty->display('predictGame.tpl');
}

/* POST */
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
	if ($log_status == 0) {
		header('Location: login.php');
	} else {
		/* Link MySQL */
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link)
			header('Location: error.php?error_code=102');
		mysqli_set_charset($link, "utf8");

		/* Get Predictable Game */
		$sql = "SELECT `id` FROM `Game` WHERE `game_flag` = '0'";
		$game_ids = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$game_ids[] = $row['id'];
		}

		/* Get category id */
		if (!isset($_GET['category_id']) || empty($_GET['category_id']))
			$_GET['category_id'] = '7';
		$id = $_GET['category_id'];

		/* Check post data */
		foreach ($game_ids as $game_id) {
			for ($i = 'a'; $i <= 'e'; $i++) {
				$post_name = $i . '-' . $game_id;
				if (isset($_POST[$post_name])) {
					$sql = "SELECT id, predict FROM Predict WHERE user_id = '" . $_SESSION['user_id'] . "' AND game_id = '" . $game_id . "' AND (predict = '$i' OR predict = '" . strtoupper($i) . "') AND predict_flag = '0'";
					$result = mysqli_query($link, $sql);
					if (mysqli_num_rows($result) == 0) {
						$sql2 = "INSERT INTO Predict (user_id, game_id, category_id, predict, predict_flag, price) VALUES ('" . $_SESSION['user_id'] . "', '" . $game_id . "', '" . $id . "', '" . $_POST[$post_name] . "', '0', '99')";
						mysqli_query($link, $sql2);
					} else {
						$predict = mysqli_fetch_assoc($result);
						$sql2 = "UPDATE Predict SET predict = '" . $_POST[$post_name] . "' WHERE id = '" . $predict['id'] . "'";
						mysqli_query($link, $sql2);
					}
				}
			}
		}
		mysqli_close($link);
		header('Location: userProfile.php?user_id=' . $_SESSION['user_id'] . '&show=predict');
	}
}
?>