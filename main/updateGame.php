<?php
include_once('main.php');
include_once('isLogin.php');

/* link database */
$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link)
	header('Location: error.php?error_code=102');
mysqli_set_charset($link, 'utf8');

for ($category_id = 1; $category_id <= 31; $category_id++) {
	$filename = getcwd() . "/documents/predictGame/" .  strval($category_id) . '.json';
	if (file_exists($filename) && ($json = file_get_contents($filename)) !== false) {
		$json_data = json_decode($json, true);

		/* Insert unknown game into DB */
		foreach ($json_data as $game) {
			$game_datetime = date("Y") . '-' . $game['date'] . ' ' . $game['time'];
			$h_name = $game['h_name'];
			$a_name = $game['a_name'];
			$details = json_encode($game['details']);
			$sql = "SELECT id FROM Game WHERE `game_datetime` = '$game_datetime' AND `h_name` = '$h_name' AND `a_name` = '$a_name' AND `category_id` = '$category_id'";
			if (($result = mysqli_query($link, $sql)) && mysqli_num_rows($result) == 0) {
				$sql2 = "INSERT INTO `Game` (`category_id`, `game_datetime`, `h_name`, `a_name`, `details`) VALUES ('$category_id', '$game_datetime', '$h_name', '$a_name', '$details')";
				$result = mysqli_query($link, $sql2);
			}
		}
	}
}
mysqli_close($link);
?>