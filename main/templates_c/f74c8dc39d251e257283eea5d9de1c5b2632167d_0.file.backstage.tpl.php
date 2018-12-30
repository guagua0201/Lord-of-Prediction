<?php
/* Smarty version 3.1.33, created on 2018-12-29 22:23:51
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/backstage.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c27e5e7ab1106_77354079',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f74c8dc39d251e257283eea5d9de1c5b2632167d' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/backstage.tpl',
      1 => 1546118629,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c27e5e7ab1106_77354079 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_14680949875c27e5e7ab0057_51527234', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_14680949875c27e5e7ab0057_51527234 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_14680949875c27e5e7ab0057_51527234',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div style='min-height: 68vh; padding: 30px'>
		<h2>後台管理頁面</h2>
		<nav class='navbar bg-light navbar-lg'>
			<ul class='navbar-nav'>
				<li class='nav-item'>
					<a href='listUser.php' class='nav-link'>用戶管理</a>
				</li>
				<li class='nav-item'>
					<a href='listArticle.php' class='nav-link'>文章管理</a>
				</li>
				<li class='nav-item'>
					<a href='listCatagory.php' class='nav-link'>分類管理</a>
				</li>
			</ul>
		</nav>
	</div>
<?php
}
}
/* {/block 'body'} */
}
