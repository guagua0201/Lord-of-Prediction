<?php
include_once('main.php');
include_once('isLogin.php');
// require_once('Excelreader/reader.php');

$smarty->assign('yesterday', strtotime("-1 day"));
$smarty->assign('tomorrow', strtotime("+1 day"));

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die("Connection failed " . mysqli_connect_error());
}
mysqli_set_charset($link, "utf8");

if (isset($_POST['submit'])) {
	header('Location: userInfo.php');
}

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

if (!isset($_GET['category_id']) || empty($_GET['category_id']))
	$_GET['category_id'] = '27';
$id = $_GET['category_id'];
$data = array();
$names = array();
$indexes = array();
$filename=  './documents/predictGame/' . $id . '.csv';

if (file_exists($filename) && ($file = fopen($filename, 'r')) !== false) {
	$names = fgetcsv($file);
	while (!feof($file)) {
		$data[] = fgetcsv($file);
	}
	array_pop($data);
	foreach (array_unique($names) as $name) {
		$indexes[$name] = array_search($name, $names);
	}
	fclose($file);
}


$smarty->assign('names', array_unique($names));
$smarty->assign('csv_head', $names);
$smarty->assign('indexes', $indexes);
$smarty->assign('data', $data);


// $reader = new Spreadsheet_Excel_Reader();
// $reader->setOutputEncoding('UTF-8');
// $reader->read('documents/predictGame.xls');

// if (!isset($_GET['category_id']) || empty($_GET['category_id']))
// 	$_GET['category_id'] = 0;

// $id = $_GET['category_id'];
// $data = array();
// $name = array();
// for ($i = 1; $i <= $reader->sheets[$id]['numCols']; $i++)
// 	$name[] = $reader->sheets[$id]['cells'][1][$i];
// for ($i = 2; $i <= $reader->sheets[$id]['numRows']; $i++) {
// 	$row = array();
// 	for ($j = 1; $j <= $reader->sheets[$id]['numCols']; $j++) {
// 		$row[] = $reader->sheets[$id]['cells'][$i][$j];
// 	}
// 	$data[] = $row;
// }
// $smarty->assign('name', $name);
// $smarty->assign('data', $data);


$smarty->display('predictGame.tpl');
?>