<?php
include_once('main.php');
include_once('isLogin.php');

if ($log_status == 2) {

	if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
		$link = mysqli_connect(db_host, db_user, db_password, db_name);
		if (!$link) {
			die('Connection failed ' . mysqli_connect_error());
		}
		mysqli_set_charset($link, 'utf8');

		if (isset($_POST['edit_category_submit'])) {
			$name = $_POST['name'];
			$description = $_POST['description'];
			$sql3 = "UPDATE Category SET name='$name', description='$description' WHERE id = '" . $_GET['category_id'] . "'";
			mysqli_query($link, $sql3);
			mysqli_close($link);
			header('Location: listCategory.php');
		}

		$sql = "SELECT id, name, description, class_id FROM Category WHERE id = '" . $_GET['category_id'] . "'";
		if ($result = mysqli_query($link, $sql)) {
			$category = mysqli_fetch_assoc($result);
			$sql2 = "SELECT name FROM Class WHERE id = '" . $category['class_id'] . "'";
			$class_info = mysqli_fetch_assoc(mysqli_query($link, $sql2));
			$category['class_name'] = $class_info['name'];
		}
		mysqli_close($link);
		$smarty->assign('category', $category);
		$smarty->display('editCategory.tpl');

	} else {
		header('Location: listCategory.php');
	}
} else {
	$smarty->assign('error', 'Permission Denied!');
	$smarty->display('error.tpl');
}
?>