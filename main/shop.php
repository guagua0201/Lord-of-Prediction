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



$sql3 = "SELECT gender FROM `User` WHERE username = '$member'";
if($result = mysqli_query($link,$sql3)){
	//echo "in<br>";
	$user = mysqli_fetch_assoc($result);
	// echo "check<br>";
	$gender = $user["gender"];
	if($gender != 0 && $gender != 1){
		$gender = 2;
	}
	// echo "check2<br>";
}
else{
	// echo "out<br>";
	$gender = 2;
}

$sql2 = "SELECT name, id,gender,category_id, price, image_url,moneyType FROM Product ";
if($gender != 2){
	$sql2 = $sql2 . "WHERE gender = " . $gender;
}
//WHERE gender = ".$gender;
$products = array();
if ($result = mysqli_query($link, $sql2)) {
	while ($row = mysqli_fetch_assoc($result))
		$products[] = $row;
}

mysqli_close($link);

$smarty->assign('categories', $categories);
$smarty->assign('products', $products);
$smarty->assign('member',$member);
$smarty->assign('usergender',$gender);
// echo "Hello $gender";
$smarty->display('shop.tpl');
?>