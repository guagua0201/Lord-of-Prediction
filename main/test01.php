<?php
include ('main.php');
$num1 = 1000;
$num2 = 2000;
$num3 = $num1 + $num2;

$smarty->assign('num3', $num3);
$smarty->display('test01.tpl.htm');
?>