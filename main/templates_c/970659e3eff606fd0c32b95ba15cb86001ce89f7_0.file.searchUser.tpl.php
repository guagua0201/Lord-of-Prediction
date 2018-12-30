<?php
/* Smarty version 3.1.33, created on 2018-12-30 20:25:22
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/searchUser.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c291ba29743e1_59797824',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '970659e3eff606fd0c32b95ba15cb86001ce89f7' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/searchUser.tpl',
      1 => 1546197921,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c291ba29743e1_59797824 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_695923975c291ba296d4e9_09835549', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_695923975c291ba296d4e9_09835549 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_695923975c291ba296d4e9_09835549',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="input-group">
					<h1>用戶搜尋</h1>
					<form method="GET" action="searchUser.php" style="width: 100%;">
						<div class='input-group'>
							<input class="form-control border-secondary py-2" type="search" placeholder="輸入用戶暱稱或用戶名" name="search" />
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div style='margin-top: 50px' class='row'>
			<div class='col-12'>
				<?php if (count($_smarty_tpl->tpl_vars['data']->value) == 0) {?>
					<h3>很抱歉沒有此用戶！</h3>
				<?php } else { ?>
					<table class='table table-striped table-hover table-bordered'>
						<thead>
							<tr>
								<th></th>
								<th>用戶名</th>
								<th>信箱</th>
								<th>暱稱</th>
								<th>性別</th>
							</tr>
						</thead>
						<tbody>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['data']->value, 'row');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['row']->value) {
?>
								<tr>
									<td>
										<img src='images/user_default.jpg' height='60px', width='60px' />
									</td>
									<td><?php echo $_smarty_tpl->tpl_vars['row']->value['username'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['row']->value['email'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['row']->value['nickname'];?>
</td>
									<td>
										<?php if ($_smarty_tpl->tpl_vars['row']->value['gender'] == 0) {?>
											男
										<?php } else { ?>
											女
										<?php }?>
									</td>
								</tr>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
						</tbody>
					</table>
				<?php }?>
			</div>
		</div>
	</div>
<?php
}
}
/* {/block 'body'} */
}
