<?php
/* Smarty version 3.1.33, created on 2018-12-29 10:49:48
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c27433cf1a115_06650333',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ef74277856d222fa3e2a77a92b7136a9171343c2' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/index.tpl',
      1 => 1546076986,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c27433cf1a115_06650333 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_14373902795c27433cf166f6_64523788', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_14373902795c27433cf166f6_64523788 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_14373902795c27433cf166f6_64523788',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div style='height: 600px'>
		<h1>Welcome to Lord-of-Prediction</h1>
		<p>hello <?php echo $_smarty_tpl->tpl_vars['member']->value;?>
</p>

		<?php if ($_smarty_tpl->tpl_vars['log_status']->value == false) {?>
			<a href='/register.php' class='btn btn-primary'>Register</a>
			<a href='/login.php' class='btn btn-primary'>Login</a>
		<?php } else { ?>
			<a href='/logout.php' class='btn btn-primary'>Logout</a>
		<?php }?>
		<a href='/backstage.php' class='btn btn-primary'>Backstage</a>
		<?php if ($_smarty_tpl->tpl_vars['log_status']->value == true) {?>
			<a href='/addArticle.php' class='btn btn-primary'>Add Article</a>
		<?php }?>
		<a href='/listArticle.php/?type=1' class='btn btn-primary'>List Article</a>
		<a href='/listArticle.php/?type=0' class='btn btn-primary'>List All Article</a>
	</div>
<?php
}
}
/* {/block 'body'} */
}
