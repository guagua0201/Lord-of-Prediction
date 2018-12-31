<?php
include_once('main.php');
include_once('isLogin.php');
require_once('Excelreader/reader.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

$reader = new Spreadsheet_Excel_Reader();
$reader->setOutputEncoding('UTF-8');
$reader->read('documents/predictGame.xls');

if (isset($_GET['category_id']) && !empty($_GET['category_id'])) {
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
	$smarty->display('predictGame.tpl');
} else {
	header('Location: /predictGame.php?category_id=4');
}
?>