<?php
include_once('main.php');
include_once('isLogin.php');
require_once('Excelreader/reader.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);
$smarty->assign('yesterday', strtotime("-1 day"));
$smarty->assign('tomorrow', strtotime("+1 day"));

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die("Connection failed " . mysqli_connect_error());
}
mysqli_set_charset($link, "utf8");

$sql = "SELECT id, name FROM Class WHERE id = 2 OR id = 3 OR id = 7 ORDER BY id";
$classes = array();
if ($result = mysqli_query($link, $sql)) {
	while ($row = mysqli_fetch_assoc($result))
		$classes[] = $row;
}
$smarty->assign('classes', $classes);

$sql2 = "SELECT id, name, class_id FROM Category WHERE 1";
$categories = array();
if ($result = mysqli_query($link, $sql2)) {
	while ($row = mysqli_fetch_assoc($result))
		$categories[] = $row;
}
$smarty->assign('categories', $categories);

mysqli_close($link);

/*
$reader = new Spreadsheet_Excel_Reader();
$reader->setOutputEncoding('UTF-8');
$reader->read('documents/predictGame.xls');

if (!isset($_GET['category_id']) || empty($_GET['category_id']))
	$_GET['category_id'] = 4;

$id = $_GET['category_id'];
$data = array();
for ($i = 1; $i <= $reader->sheets[$id]['numRows']; $i++) {
	$row = array();
	for ($j = 2; $j <= 10; $j++) {
		$row[] = $reader->sheets[$id]['cells'][$i][$j];
	}
	$data[] = $row;
}
$smarty->assign('data', $data);
*/
$smarty->display('predictGame.tpl');
?>