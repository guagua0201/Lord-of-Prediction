<?php
include_once('main.php');
include_once('isLogin.php');

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

	$smarty->assign('row', $row);
	$smarty->assign('category_name', $row2['name']);
	$smarty->assign('author_name', $row3['nickname']);
	$smarty->assign('author_image', $row3['image']);
	
	// Get all comment
	$sql4 = "SELECT user_id, content, create_time FROM Comment WHERE article_id='" . $_GET['id'] . "'";
	$comment = array();
	if ($result = mysqli_query($link, $sql4)) {
		while ($row4 = mysqli_fetch_assoc($result)) {
			$sql5 = "SELECT nickname, image FROM User WHERE id='" . $row4['user_id'] . "'";
			$user_result = mysqli_fetch_assoc(mysqli_query($link, $sql5));
			$row4['user_name'] = $user_result['nickname'];
			$row4['user_image'] = $user_result['image'];
			while (strlen($row4['user_image']) < 5)
				$row4['user_image'] = '0' . $row4['user_image'];
			$comment[] = $row4;
		}
	}
	$smarty->assign('comments', $comment);

	mysqli_close($link);
	$smarty->display('showArticle.tpl');
} else {
	header('Location: /listArticle.php');
}
?>