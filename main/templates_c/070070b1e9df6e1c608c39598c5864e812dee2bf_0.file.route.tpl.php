<?php
/* Smarty version 3.1.33, created on 2018-12-30 16:49:15
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/route.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c28e8fb16e7c6_22791699',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '070070b1e9df6e1c608c39598c5864e812dee2bf' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/route.tpl',
      1 => 1546184954,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:header.tpl' => 1,
    'file:footer.tpl' => 1,
  ),
),false)) {
function content_5c28e8fb16e7c6_22791699 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
?>
<!DOCTYPE html>
<html>
	<head>
	  <title>Hello</title>
	  <link rel="stylesheet" href="/stylesheets/style.css">
	  <link rel="icon" href="/images/favicon.ico">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	  <?php echo '<script'; ?>
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"><?php echo '</script'; ?>
>
	  <?php echo '<script'; ?>
 src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"><?php echo '</script'; ?>
>
	  <?php echo '<script'; ?>
 src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"><?php echo '</script'; ?>
>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	</head>
	<body>
		<?php $_smarty_tpl->_subTemplateRender('file:header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
		<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_17508679415c28e8fb16d6a1_96545512', 'body');
?>

		<?php $_smarty_tpl->_subTemplateRender('file:footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
	</body>
</html>
<?php }
/* {block 'body'} */
class Block_17508679415c28e8fb16d6a1_96545512 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_17508679415c28e8fb16d6a1_96545512',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block 'body'} */
}
