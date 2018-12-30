<?php
/* Smarty version 3.1.33, created on 2018-12-30 21:17:34
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/addArticle.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c2927de1ecd24_60349913',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '68ea769848e3ce654895ce2899d43cde981ba3c8' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/addArticle.tpl',
      1 => 1546201049,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c2927de1ecd24_60349913 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_9130788865c2927de1e7604_25550289', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_9130788865c2927de1e7604_25550289 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_9130788865c2927de1e7604_25550289',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div style='min-height: 68vh' class='container'>
		<h2>新增討論</h2>
		<form method='POST' action='addArticle.php'>
			<div class='form-group'>
				<label for='category'>分類</label>
				<select id='category' name='category' class='custom-select'>
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value, 'row');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['row']->value) {
?>
						<option value="<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['row']->value['name'];?>
</option>
					<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
				</select>
			</div>
			<div class='form-group'>
				<label for='title'>標題</label>
				<input type='text' id='title' name='title' class='form-control form-control-lg' />
			</div>
			<div class='form-group'>
				<label for='content'>內文</label>
				<textarea rows='20' id='content' name='content' class='form-control form-control-lg'></textarea>
			</div>
			<div class='form-group'>
				<button type='submit' style='width: 100%' class='btn btn-dark btn-lg'>確認</button>
				<input type='hidden' name='submit' value='submit' />
			</div>
		</form>
	</div>
<?php
}
}
/* {/block 'body'} */
}
