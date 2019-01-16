<?php
include_once('main.php');
include_once('isLogin.php');
$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

if (isset($_GET['id']) && !empty($_GET['id'])) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	mysqli_set_charset($link, "utf8");
	$sql = "SELECT * FROM Article WHERE id='" . $_GET['id'] . "'";
	$row = mysqli_fetch_assoc(mysqli_query($link, $sql));

	// Get selected article's category name
	$sql2 = "SELECT name FROM Category WHERE id='" . $row['category_id'] . "'";
	$row2 = mysqli_fetch_assoc(mysqli_query($link, $sql2));

	// Get selected article's author infor
	$sql3 = "SELECT nickname, image FROM User WHERE id='" . $row['author'] . "'";
	$row3 = mysqli_fetch_assoc(mysqli_query($link, $sql3));
	while (strlen($row3['image']) < 5)
		$row3['image'] = '0' . $row3['image'];
	// echo $row3['image'];
	
	/*
		 Get comment
	*/

	$smarty->assign('row', $row);
	$smarty->assign('category_name', $row2['name']);
	$smarty->assign('author_name', $row3['nickname']);
	$smarty->assign('author_image', $row3['image']);
	$smarty->display('showArticle.tpl');
} else {
	header('Location: /listArticle.php');
}
?>