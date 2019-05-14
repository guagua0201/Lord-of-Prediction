<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		throw_error("300", mysqli_connect_error());
	}
	mysqli_set_charset($link, "utf8");

	if ($_SERVER['REQUEST_METHOD'] === 'GET') {
		$sql = "SELECT `id`, `name` FROM `Category`";
		$data = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$data[] = $row;
		} else {
			throw_error("301", "");
		}
		$smarty->assign('data', $data);
		$smarty->display('addArticle.tpl');
	} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		if (isset($_POST['title']) && !empty($_POST['title']) && isset($_POST['content']) && !empty($_POST['content'])) {
			$category = $_POST['category'];
			$title = mysqli_real_escape_string($link, trim($_POST['title']));
			$content = mysqli_real_escape_string($link, $_POST['content']);
			$user_id = $_SESSION['user_id'];
			$sql = "INSERT INTO Article (title, content, category_id, author) VALUES ('$title', '$content', '$category', '$user_id')";
			if (!mysqli_query($link, $sql))
				throw_error("301", "");
			mysqli_close($link);
			header('Location: searchArticle.php');
		} else {
			throw_error("404", "");
		}
	}
} else {
	header('Location: login.php');
}
?>
