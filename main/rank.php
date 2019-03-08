<?php
include_once('main.php');
include_once('isLogin.php');

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

if (!isset($_GET['category_id']) || empty($_GET['category_id']))
	$_GET['category_id'] = 27;
$id = $_GET['category_id'];

$sql3 = "SELECT user_id, failure, success, rating FROM Rating WHERE category_id = '$id' ORDER BY rating DESC LIMIT 5";
$sql4 = "SELECT user_id, failure, success, rating FROM Rating WHERE category_id = '$id' ORDER BY rating ASC LIMIT 5";

$top_rank = array();
if ($result = mysqli_query($link, $sql3)) {
	while ($row = mysqli_fetch_assoc($result)) {
		$sql5 = "SELECT nickname, image FROM User WHERE id = '" . $row['user_id'] . "'";
		$user_info = mysqli_fetch_assoc(mysqli_query($link, $sql5));
		$row['user_nickname'] = $user_info['nickname'];
		$row['user_image'] = $user_info['image'];
		while (strlen($row['user_image']) < 5)
			$row['user_image'] = '0' . $row['user_image'];
		$top_rank[] = $row;
	}
}

$last_rank = array();
if ($result = mysqli_query($link, $sql4)) {
	while ($row = mysqli_fetch_assoc($result)) {
		$sql5 = "SELECT nickname, image FROM User WHERE id = '" . $row['user_id'] . "'";
		$user_info = mysqli_fetch_assoc(mysqli_query($link, $sql5));
		$row['user_nickname'] = $user_info['nickname'];
		$row['user_image'] = $user_info['image'];
		while (strlen($row['user_image']) < 5)
			$row['user_image'] = '0' . $row['user_image'];
		$last_rank[] = $row;
	}
}

mysqli_close($link);
$smarty->assign('top_rank', $top_rank);
$smarty->assign('last_rank', $last_rank);
$smarty->display('rank.tpl');
?>