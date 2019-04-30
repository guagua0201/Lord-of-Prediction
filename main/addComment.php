<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	if (isset($_GET['article_id']) && !empty($_GET['article_id'])) {
		if (isset($_POST['submit'])) {
			$article_id = $_GET['article_id'];
			$user_id = $_SESSION['user_id'];
			$content = $_POST['editor'];
			$link = mysqli_connect(db_host, db_user, db_password, db_name);
			if (!$link) {
				die('Connection failed ' . mysqli_connect_error());
			}
			mysqli_set_charset($link, "utf8");
			$sql = "INSERT INTO Comment (article_id, user_id, content) VALUES ('$article_id', '$user_id', '$content')";
			// printf("%s", $sql);
			mysqli_query($link, $sql);
			mysqli_close($link);
			header("Location: /showArticle.php?id=" . $_GET['article_id']);
		} else {
			header("Location: /showArticle.php?id=" . $_GET['article_id']);
		}
	} else {
		header('Location: /index.php');
	}
} else {
	header('Location: /login.php');
}
?>