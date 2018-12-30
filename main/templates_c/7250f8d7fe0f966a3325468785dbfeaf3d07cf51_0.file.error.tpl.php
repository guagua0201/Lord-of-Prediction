<?php
/* Smarty version 3.1.33, created on 2018-12-29 22:23:16
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/error.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c27e5c437f3c6_95510268',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7250f8d7fe0f966a3325468785dbfeaf3d07cf51' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/error.tpl',
      1 => 1546117707,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c27e5c437f3c6_95510268 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_18748804965c27e5c437d760_33834451', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_18748804965c27e5c437d760_33834451 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_18748804965c27e5c437d760_33834451',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class='jumborton' style='text-align: center; min-height: 68vh'>
		<h1 style='color: red'><?php echo $_smarty_tpl->tpl_vars['error']->value;?>
</h1>
	</div>
<?php
}
}
/* {/block 'body'} */
}
