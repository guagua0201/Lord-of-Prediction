<?php
include_once('main.php');
include_once('isLogin.php');

/* link database */
$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	throw_error("300", mysqli_connect_error());
}
mysqli_set_charset($link, 'utf8');

/* Update Running Game */
$sql = "SELECT `id`, `game_datetime` FROM `Game` WHERE `game_flag` = 0";
if ($result = mysqli_query($link, $sql)) {
	$game_info = mysqli_fetch_assoc($result);
	$now_date = date("Y-m-d H:i:s");
	if ($now_date > $game_info['game_datetime']) {
		$sql2 = "UPDATE `Game` SET `game_flag` = 4 WHERE `id` = " . $game_info['id'];
		if (!mysqli_query($link, $sql2)) {
			throw_error("301", "");
		}
	}
} else {
	throw_error("301", "");
}

/* Check all Categories */
for ($category_id = 1; $category_id <= 31; $category_id++) {
	if (defined(config_status)) {
		$filename = "/home/justin/Desktop/Work/ProphecyKing/Lord-of-Prediction/main/documents/predictGame" . strval($category_id) . '.json';
	} else {
		$filename = "/home/qeayg91ioeue/public_html/documents/predictGame/" .  strval($category_id) . '.json';
	}
	// echo $filename;
	
	/* Read file */
	if (file_exists($filename) && ($json = file_get_contents($filename)) !== false) {
		$json_data = json_decode($json, true);
		foreach ($json_data as $data) {
			$game_datetime = date("Y") . '-' . $data['date'] . ' ' . $data['time'];
			$h_name = $data['h_name'];
			$a_name = $data['a_name'];
			$h_score = $data['h_score'];
			$a_score = $data['a_score'];
			/* Get must update data */
			$sql = "SELECT `id`, `h_score`, `a_score`, `details` FROM Game WHERE `game_datetime` = '$game_datetime' AND `h_name` = '$h_name' AND `a_name` = '$a_name' AND (`game_flag` = '0' OR `game_flag` = '4')";
			if ($game_result = mysqli_query($link, $sql)) {
				if (mysqli_num_rows($game_result) != 1)
					continue;
				$game = mysqli_fetch_assoc($game_result);
				/* update game data */
				$sql2 = "UPDATE `Game` SET `game_flag` = '1', `h_score` = '$h_score', `a_score` = '$a_score' WHERE `id` = '" . $game['id'] . "'";
				mysqli_query($link, $sql2);

				/* get must update predict */
				$sql2 = "SELECT `id`, `user_id`, `predict`, `category_id` FROM `Predict` WHERE `game_id` = '" . $game['id'] . "' AND (`predict_flag` = '0' OR `predict_flag` = '3')";
				$detail = json_decode($game['details'], true);
				if ($predict_result = mysqli_query($link, $sql2)) {
					while ($row = mysqli_fetch_assoc($predict_result)) {
						$flag = 0;
						/* Check win / lose */
						/* lowercase: away team, uppercase: home team */
						if ($row['predict'] == 'a' || $row['predict'] == 'A') {
							/* handicap */
							$a_handicap_score = $a_score;
							$h_handicap_score = $h_score;
							if (isset($detail['handicap']['h_spread']))
								$a_handicap_score += $detail['handicap']['h_spread'];
							if (isset($detail['handicap']['a_spread']))
								$h_handicap_score += $detail['handicap']['a_spread'];
							if ($a_handicap_score > $h_handicap_score)
								$flag = $row['predict'] == 'a' ? 1 : 2;
							else if ($a_handicap_score < $h_handicap_score)
								$flag = $row['predict'] == 'A' ? 1 : 2;
							else
								$flag = 3;
						} else if ($row['predict'] == 'b' || $row['predict'] == 'B') {
							/* total */
							$total = $h_score + $a_score;
							if ($total > $detail['total']['point'])
								$flag = $row['predict'] == 'b' ? 1 : 2;
							else if ($total < $detail['total']['point'])
								$flag = $row['predict'] == 'B' ? 1 : 2;
							else
								$flag = 3;
						} else if ($row['predict'] == 'c' || $row['predict'] == 'C') {
							/* single */
							if ($a_score > $h_score)
								$flag = $row['predict'] == 'c' ? 1 : 2;
							else if ($a_score < $h_score)
								$flag = $row['predict'] == 'C' ? 1 : 2;
							else
								$flag = 3;
						} else if ($row['predict'] == 'd' || $row['predict'] == 'D') {
							/* one lose two win */
							$a_one_lose_two_win_score = $a_score;
							$h_one_lose_two_win_score = $h_score;
							if (isset($detail['one_lose_two_win']['h_spread']))
								$a_one_lose_two_win_score += $detail['one_lose_two_win']['h_spread'];
							if (isset($detail['one_lose_two_win']['a_spread']))
								$h_one_lose_two_win_score += $detail['one_lose_two_win']['a_spread'];
							if ($a_one_lose_two_win_score > $h_one_lose_two_win_score)
								$flag = $row['predict'] == 'd' ? 1 : 2;
							else if ($a_one_lose_two_win_score < $h_one_lose_two_win_score)
								$flag = $row['predict'] == 'D' ? 1 : 2;
							else
								$flag = 3;
						} else if ($row['predict'] == 'e' || $row['predict'] == 'E') {
							/* odd even */
							$total = $h_score + $a_score;
							if ($total % 2 == 1)
								$flag = $row['predict'] == 'e' ? 1 : 2;
							else
								$flag = $row['predict'] == 'E' ? 1 : 2;
						}

						/* Update Predict */
						$sql3 = "UPDATE `Predict` SET `predict_flag` = '$flag' WHERE `id` = '" . $row['id'] . "'";
						mysqli_query($link, $sql3);

						/* Update Rating */
						if ($flag == 1 || $flag == 2) {
							$sql3 = "SELECT `id`, `success`, `failure`, `rating` FROM `Rating` WHERE `user_id` = '" . $row['user_id'] . "' AND `category_id` = '" . $row['category_id'] . "'";
							if ($rating_result = mysqli_query($link, $sql3)) {
								if (mysqli_num_rows($rating_result) == 1) {
									$rating_info = mysqli_fetch_assoc($rating_result);
									if ($flag == 1)
										$rating_info['success'] += 1;
									else if ($flag == 2)
										$rating_info['failure'] += 1;
									$rating_info['rating'] = $rating_info['success'] / ($rating_info['success'] + $rating_info['failure']) * 100.0;
									$sql4 = "UPDATE `Rating` SET `success` = '" . $rating_info['success'] . "', `failure` = '" . $rating_info['failure'] . "', `rating` = '" . $rating_info['rating'] . "' WHERE `id` = '" . $rating_info['id'] . "'";
									mysqli_query($link, $sql4);
								} else {
									$success = 0 + ($flag == 1);
									$failure = 0 + ($flag == 2);
									$rating = $success / ($success + $failure) * 100.0;
									$sql4 = "INSERT INTO `Rating` (`user_id`, `category_id`, `success`, `failure`, `rating`) VALUES ('" . $row['user_id'] . "', '" . $row['category_id'] . "', '$success', '$failure', '$rating')";
									mysqli_query($link, $sql4);
								}
							}
						}
					}
				}
			}
		}
	}
}
mysqli_close($link);
?>
