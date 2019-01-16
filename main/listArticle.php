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
	$sql = "SELECT id, category_id, title, author, update_time FROM Article";
	if (isset($_GET['search']) && !empty($_GET['search'])) {
		$search = mysqli_real_escape_string($link, trim($_GET['search']));
		$sql = "SELECT id, category_id, title, author, update_time FROM Article WHERE title LIKE '%" . $search . "%' OR content LIKE '%" . $search . "%' OR author LIKE '%" . $search . "%'";
		// echo $sql;
	}

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
	mysqli_close($link);
	$smarty->assign('data', $data);
	$smarty->display('listArticle.tpl');
} else {
	$smarty->assign('error', 'Perssion Denied!');
	$smarty->display('error.tpl');
}
?>