<?php
include_once('main.php');
include_once('isLogin.php');

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link)
	header('error.php?error_code=102');
mysqli_set_charset($link, 'utf8');

/* Collect all classes and categories */
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

/* Check Get Date */
$datepick = date("Y/m/d");
if (isset($_GET['date']) && !empty($_GET['date']))
	$datepick = $_GET['date'];

/* Check category_id */
$category_id = 7;
if (isset($_GET['category_id']) && !empty($_GET['category_id']))
	$category_id = $_GET['category_id'];

/* Select All History Games */
$sql = "SELECT `id`, `game_datetime`, `h_name`, `a_name`, `h_score`, `a_score`, `details` FROM `Game` WHERE DATE_FORMAT(`game_datetime`, '%Y/%m/%d') = '$datepick' AND `category_id` = '$category_id' AND `game_flag` != '0'";
$data = array();
$names = array();
if ($result = mysqli_query($link, $sql)) {
	while ($row = mysqli_fetch_assoc($result)) {
		$row['details'] = json_decode($row['details'], true);
		$data[] = $row;
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

$smarty->display('historyGame.tpl');
?>