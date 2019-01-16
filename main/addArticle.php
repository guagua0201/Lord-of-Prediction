<?php
include_once('main.php');
include_once('isLogin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

if ($log_status != 0) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	mysqli_set_charset($link, "utf8");
	$sql = "SELECT id, name FROM Category";
	$data = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result))
			$data[] = $row;
	}
	$smarty->assign('data', $data);
	$smarty->display('addArticle.tpl');
	if (isset($_POST['submit'])) {
		$category = $_POST['category'];
		$title = mysqli_real_escape_string($link, trim($_POST['title']));
		$content = mysqli_real_escape_string($link, $_POST['content']);
		$user_id = $_SESSION['user_id'];
		if (!empty($title) && !empty($content)) {
			$sql2 = "INSERT INTO Article (title, content, category_id, author) VALUES ('$title', '$content', '$category', '$user_id')";
			mysqli_query($link, $sql2);
		}
	//	echo $sql2;
		mysqli_close($link);
		header('Location: /searchArticle.php');
	} else {
		mysqli_close($link);
	}
} else {
	header('Location: /login.php');
}
?>