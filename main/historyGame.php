<?php
include_once('main.php');
include_once('isLogin.php');
// require_once('Excelreader/reader.php');

$smarty->assign('yesterday', strtotime("-1 day"));
$smarty->assign('tomorrow', strtotime("+1 day"));

/* Link MySQL */
$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die("Connection failed " . mysqli_connect_error());
}
mysqli_set_charset($link, "utf8");

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
	$_GET['category_id'] = '27';
$id = $_GET['category_id'];
$data = array();
$names = array();
$indexes = array();
$filename=  './documents/historyGame/' . $id . '.csv';

if (file_exists($filename) && ($file = fopen($filename, 'r')) !== false) {
	$names = fgetcsv($file);
	if (!empty($names)) {
		while (!feof($file)) {
			$data[] = fgetcsv($file);
		}
		array_pop($data);
		foreach (array_unique($names) as $name) {
			$indexes[$name] = array_search($name, $names);
		}
	}
	fclose($file);
}

// if (empty($names)) {
// 	$smarty->assign('names', array());
// }
// else {
// 	$smarty->assign('names', array_unique($names));
// }
// $smarty->assign('csv_head', $names);
// $smarty->assign('indexes', $indexes);

// $game_id = array();
foreach ($data as $game) {
	$date = $game[$indexes['比賽時間']];
	$time = $game[$indexes['比賽時間'] + 1];
	$home_team = $game[$indexes['主客隊'] + 3];
	$home_team_score = $game[$indexes['主客隊'] + 2];
	$away_team = $game[$indexes['主客隊'] + 1];
	$away_team_score = $game[$indexes['主客隊']];
	$sql3 = "SELECT id FROM Game WHERE `date` = '$date' AND `time` = '$time' AND `home_team` = '$home_team' AND `away_team` = '$away_team' AND `category_id` = '$id'";
	// echo $sql3;
	if ($result = mysqli_query($link, $sql3)) {
		if (mysqli_num_rows($result)) {
			/* Update Game Score & Flag */
			$game_info = mysqli_fetch_assoc($result);
			$sql4 = "UPDATE Game SET `game_flag` = '1', `home_team_score` = $home_team_score, `away_team_score` = $away_team_score WHERE `id` = '" . $game_info['id'] . "'";
			mysqli_query($link, $sql4);
			/* Update Predict Flag*/
			$sql5 = "SELECT id, user_id, predict, category_id FROM Predict WHERE game_id = '" . $game_info['id'] . "' AND predict_flag = '0'";
			echo $sql5;
			if ($result2 = mysqli_query($link, $sql5)) {
				while ($row = mysqli_fetch_assoc($result2)) {
					$flag = 0;
					if ($row['predict'] == 'a' || $row['predict'] == 'A') {

					} else if ($row['predict'] == 'c' || $row['predict'] == 'C') {
						if ($home_team_score > $away_team_score)
							$flag = ($row['predict'] == 'C') ? 1 : 2;
						else if ($home_team_score < $away_team_score)
							$flag = ($row['predict'] == 'c') ? 1 : 2;
						else
							$flag = 3;
					}
					$sql6 = "UPDATE Predict SET predict_flag = '$flag' WHERE id = '" . $row['id'] . "'";
					echo $sql6;
					mysqli_query($link, $sql6);

					/* Update Rating */
					if ($flag == 1 || $flag == 2) {
						
					}
				}
			}
		}
		// $game_info['']
	}
	// $gameid = mysqli_fetch_assoc($result);
	// $game_id[] = $gameid['id'];
}
echo "<a href='index.php'>HOME</a>";
?>