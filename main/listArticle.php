<?php
include_once('main.php');
include_once('isLogin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

if ($log_status === 2) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	mysqli_set_charset($link, "utf8");

	$sql = "SELECT id, category_id, title, author, update_time FROM Article WHERE ";
	$condition = 0;
	if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
		$sql = $sql . "category_id = " . $_GET['category_id'];
		$condition++;
		$smarty->assign('category_id', $_GET['category_id']);
	}
	if (isset($_GET['search']) && !empty($_GET['search'])) {
		$search = mysqli_real_escape_string($link, trim($_GET['search']));
		if ($condition > 0)
			$sql = $sql . " AND (";
		$sql = $sql . "title LIKE '%" . $search . "%' OR content LIKE '%" . $search . "%' OR author LIKE '%" . $search . "%'";
		if ($condition > 0)
			$sql = $sql . ")";
		$condition++;
	}
	if ($condition == 0)
		$sql = $sql . "1";

	$data = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result)) {
			$sql2 = "SELECT username FROM User WHERE id = '" . $row['author'] . "'";
			$user_result = mysqli_fetch_assoc(mysqli_query($link, $sql2));
			$row['user_username'] = $user_result['username'];
			$sql3 = "SELECT name FROM Category WHERE id = '" . $row['category_id'] . "'";
			$category_result = mysqli_fetch_assoc(mysqli_query($link, $sql3));
			$row['category_name'] = $category_result['name'];
			// foreach ($row as $key => $value) {
			// 	printf("key: %s, value=%s\n", $key, $value);
			// }
			$data[] = $row;
		}
	}

	$sql4 = "SELECT id, name FROM Class WHERE 1 ORDER BY id";
	$classes = array();
	if ($result = mysqli_query($link, $sql4)) {
		while ($row = mysqli_fetch_assoc($result))
			$classes[] = $row;
	}

	$sql5 = "SELECT id, name, class_id FROM Category WHERE 1";
	$categories = array();
	if ($result = mysqli_query($link, $sql5)) {
		while ($row = mysqli_fetch_assoc($result))
			$categories[] = $row;
	}

	mysqli_close($link);
	$smarty->assign('data', $data);
	$smarty->assign('classes', $classes);
	$smarty->assign('categories', $categories);
	$smarty->display('listArticle.tpl');
} else {
	$smarty->assign('error', 'Perssion Denied!');
	$smarty->display('error.tpl');
}
?>