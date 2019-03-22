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
$filename=  './documents/predictGame/' . $id . '.csv';

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

if (empty($names)) {
	$smarty->assign('names', array());
}
else {
	$smarty->assign('names', array_unique($names));
}
$smarty->assign('csv_head', $names);
$smarty->assign('indexes', $indexes);

/* Insert unknown game into DB */
$game_id = array();
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

for ($i = 0; $i < count($data); $i++)
	$data[$i]['id'] = $game_id[$i];
$smarty->assign('data', $data);

/* Get POST */
if (isset($_POST['submit'])) {
	if ($log_status == 0) {
		header('Location: /login.php');
	} else {
		foreach ($data as $game) {
			for ($i = 'a'; $i <= 'e'; $i++) {
				$post_name = $i . '-' . $game['id'];
				if (isset($_POST[$post_name])) {
					$sql5 = "SELECT id, predict FROM Predict WHERE user_id = '" . $_SESSION['user_id'] . "' AND game_id = '" . $game['id'] . "' AND (predict = '$i' OR predict = '" . strtoupper($i) . "') AND predict_flag = '0'";
					$result = mysqli_query($link, $sql5);
					if (mysqli_num_rows($result) == 0) {
						$sql6 = "INSERT INTO Predict (user_id, game_id, category_id, predict, predict_flag, price) VALUES ('" . $_SESSION['user_id'] . "', '" . $game['id'] . "', '" . $id . "', '" . $_POST[$post_name] . "', '0', '99')";
						mysqli_query($link, $sql6);
					} else {
						$predict = mysqli_fetch_assoc($result);
						$sql6 = "UPDATE Predict SET predict = '" . $_POST[$post_name] . "' WHERE id = '" . $predict['id'] . "'";
						mysqli_query($link, $sql6);
					}
				}
			}
		}
	}
}

mysqli_close($link);

$smarty->display('predictGame.tpl');
?>