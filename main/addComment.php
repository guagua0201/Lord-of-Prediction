<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status != 0) {
	if (isset($_GET['article_id']) && !empty($_GET['article_id'])) {
		// connect to database
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			throw_error("300", mysqli_connect_error());
		}
		mysqli_set_charset($link, "utf8");

		// check if aritcle id exist
		$sql = "SELECT `id` FROM `Article` WHERE `id` = " . $_GET['article_id'];
		if ($result = mysqli_query($link, $sql)) {
			if (mysqli_num_rows($result) != 1)
				throw_error("404", "article does not exist");
		} else {
			throw_error("301", "");
		}

		// insert new comment into database
		if (isset($_POST['editor']) && !empty($_POST['editor'])) {
			$article_id = $_GET['article_id'];
			$user_id = $_SESSION['user_id'];
			$content = $_POST['editor'];
			$sql = "INSERT INTO `Comment` (`article_id`, `user_id`, `content`) VALUES ('$article_id', '$user_id', '$content')";
			if (!mysqli_query($link, $sql))
				throw_error("301", "");
			mysqli_close($link);
			header("Location: /showArticle.php?id=" . $_GET['article_id']);
		} else {
			throw_error("406", "content must not be empty");
		}
	} else {
		throw_error("404", "");
	}
} else {
	header('Location: /login.php');
}
?>
