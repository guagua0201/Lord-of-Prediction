<?php
require_once('Smarty/Smarty.class.php');
require_once('./configs/config.php');

$smarty = new Smarty();
$smarty->template_dir = APP_REAL_PATH . "/templates/";
$smarty->compile_dir = APP_REAL_PATH . "/templates_c/";
?>
