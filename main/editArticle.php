<?php
include_once('main.php');
include_once('isLogin.php');
$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

if ($log_status === 2) {
	if (isset($_GET['id']) && !empty($_GET['id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		mysqli_set_charset($link, "utf8");

		// Get all category
		$sql = "SELECT id, name FROM Category";
		$data = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$data[] = $row;
		}

		// Get selected article title & content
		$sql2 = "SELECT * FROM Article WHERE id='" . $_GET['id'] . "'";
		$article_row = mysqli_fetch_assoc(mysqli_query($link, $sql2));

		$smarty->assign('data', $data);
		$smarty->assign('article_row', $article_row);
		$smarty->display('editArticle.tpl');

		if (isset($_POST['submit'])) {
			$category = $_POST['category'];
			$title = mysqli_real_escape_string($link, trim($_POST['title']));
			$content = mysqli_real_escape_string($link, $_POST['content']);
			if (!empty($title) && !empty($content)) {
				$sql3 = "UPDATE Article SET title='$title', content='$content', category_id='$category' WHERE id='" . $_GET['id'] . "'";
				mysqli_query($link, $sql3);
			//	echo $sql3;
			}
			mysqli_close($link);
		//	echo "hello world!!";
			header('Location: /listArticle.php');
		}
	} else {
	//	echo "hello";
		header('Location: /listArticle.php');
	}
} else if ($log_status === 1) {
	if (isset($_GET['id']) && !empty($_GET['id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		mysqli_set_charset($link, "utf8");

		// Get all category
		$sql = "SELECT id, name FROM Category";
		$data = array();
		if ($result = mysqli_query($link, $sql)) {
			while ($row = mysqli_fetch_assoc($result))
				$data[] = $row;
		}

		// Get selected article title & content
		$sql2 = "SELECT * FROM Article WHERE id='" . $_GET['id'] . "'";
		$article_row = mysqli_fetch_assoc(mysqli_query($link, $sql2));
		if ($article_row['author'] == $member) {
			$smarty->assign('data', $data);
			$smarty->assign('article_row', $article_row);
			$smarty->display('editArticle.tpl');

			if (isset($_POST['submit'])) {
			$category = $_POST['category'];
			$title = mysqli_real_escape_string($link, trim($_POST['title']));
			$content = mysqli_real_escape_string($link, $_POST['content']);
			if (!empty($title) && !empty($content)) {
				$sql3 = "UPDATE Article SET title='$title', content='$content', category_id='$category' WHERE id='" . $_GET['id'] . ".";
				mysqli_query($link, $sql3);
			}
			mysqli_close($link);
			header('Location: /listArticle.php');
		}
		} else {
			$smarty->assign('error', 'Permission Denied!');
			$smarty->display('error.tpl');
		}
	}
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>