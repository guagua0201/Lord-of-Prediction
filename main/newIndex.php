<?php
include_once('main.php');
include_once('isLogin.php');

// link mysql
$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	throw_error("300", mysqli_connect_error());
}
mysqli_set_charset($link, 'utf8');

// Get predicts

// Get articles
$sql = "SELECT `id`, `title`, `author`, `category_id` FROM `Article` WHERE 1 ORDER BY `publish_time` DESC LIMIT 6";
$articles = array();
if ($result = mysqli_query($link, $sql)) {
	while ($row = mysqli_fetch_assoc($result)) {
		$sql2 = "SELECT `name` FROM `Category` WHERE `id` = " . $row['category_id'];
		if ($cate_result = mysqli_query($link, $sql2)) {
			$row['category_name'] = mysqli_fetch_assoc($cate_result)['name'];
		} else {
			throw_error("301", "");
		}

		$sql2 = "SELECT `nickname` FROM `User` WHERE `id` = " . $row['author'];
		if ($user_result = mysqli_query($link, $sql2)) {
			$row['author_name'] = mysqli_fetch_assoc($user_result)['nickname'];
		} else {
			throw_error("301", "");
		}
		$articles[] = $row;
	}
} else {
	throw_error("301", "");
}
$smarty->assign('articles', $articles);

// Get ranks

$smarty->display('newIndex.tpl');
?>