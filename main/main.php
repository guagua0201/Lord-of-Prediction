<?php
require_once('./smarty-3.1.33/libs/Smarty.class.php');
require_once('./configs/config.php');

$smarty = new Smarty();
$smarty->template_dir = APP_REAL_PATH . "/templates/";
$smarty->compile_dir = APP_REAL_PATH . "/templates_c/";
?>
