<?php
include_once('main.php');
include_once('isLogin.php');

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die('Connection failed ' . mysqli_connect_error());
}
// mysqli_query($link, "SET CHARACTER SET UTF8");
mysqli_set_charset($link, "utf8");


if (!isset($_GET['page_id']) ) {
	$page_id = 1;
}
else{
	$page_id = $_GET['page_id'];
}


$sql = "SELECT id, category_id, title, author, update_time FROM Article WHERE ";
$condition = 0;
if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
	$sql = $sql . "category_id = " . $_GET['category_id'];
	$condition++;
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

$maxPage = 0;
if($result = mysqli_query($link,$sql)){
	$maxPage = ceil($result->num_rows / 10);
}

//$sql = $sql . " ORDER BY title DESC";
$nowOffset = $page_id*10-10;
$sql = $sql . " LIMIT $nowOffset,10";

$smarty->assign("sql",$sql);

// echo $sql;


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
// echo gettype($data);
$smarty->assign('data', $data);
$smarty->assign('classes', $classes);
$smarty->assign('categories', $categories);
$smarty->assign('page_id',$page_id);
$smarty->assign('maxPage',$maxPage);
$smarty->display('searchArticle.tpl');
?>