<?php
require('/usr/local/lib/php/Smarty/Smarty.class.php');
$smarty = new Smarty();
$smarty->template_dir = "/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates";
$smarty->compile_dir = "/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates_c";

$result = exec("/usr/bin/python pythons/get_file.py /tmp");
$result_array = json_decode($result);
foreach($result_array as $row) {
	echo $row . "<br />";
}
?>
