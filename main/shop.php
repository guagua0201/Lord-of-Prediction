<?php
include_once('main.php');
include_once('isLogin.php');

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die('Connection failed ' . mysqli_connect_error());
}
mysqli_set_charset($link, 'utf8');

$sql = "SELECT * FROM ProductCategory";
$categories = array();
if ($result = mysqli_query($link, $sql)) {
	while ($row = mysqli_fetch_assoc($result))
		$categories[] = $row;
}

$sql2 = "SELECT name, id,category_id, price, image_url FROM Product";
$products = array();
if ($result = mysqli_query($link, $sql2)) {
	while ($row = mysqli_fetch_assoc($result))
		$products[] = $row;
}

$smarty->assign('categories', $categories);
$smarty->assign('products', $products);
$smarty->assign('member',$member);
$smarty->display('shop.tpl');
?>