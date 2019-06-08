<?php
	include_once('main.php');
	include_once('isLogin.php');
	$strJsonFileContents = file_get_contents("./documents/result.json");
	$array = json_decode($strJsonFileContents,true);
	//var_dump($array);
	$baseballAll = $array;
//	var_dump($baseballAll);
//	echo $baseballAll["start"];
	$smarty->assign('baseballAll', $baseballAll);
	$smarty->display('liveScore.tpl');
?>