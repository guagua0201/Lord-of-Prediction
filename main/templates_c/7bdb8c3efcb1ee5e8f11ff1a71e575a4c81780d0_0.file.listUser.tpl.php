<?php
/* Smarty version 3.1.33, created on 2018-12-29 22:51:58
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/listUser.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c27ec7ea8ff96_95080185',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7bdb8c3efcb1ee5e8f11ff1a71e575a4c81780d0' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/listUser.tpl',
      1 => 1546118703,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c27ec7ea8ff96_95080185 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_5951500335c27ec7ea83db1_85238482', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_5951500335c27ec7ea83db1_85238482 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_5951500335c27ec7ea83db1_85238482',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="container" style='min-height: 68vh'>
		<div class="row">
			<div class="col-12">
				<div class="input-group">
					<form method="GET" action="listUser.php" style="width: 100%;">
						<div class="input-group-append">
							<input class="form-control border-secondary py-2" type="search" placeholder="輸入用戶暱稱" name="username" />
							<button class="btn btn-outline-secondary" type="submit"><i class="fa fa-search"></i></button>
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
					<table class='table table-striped table-hover'>
						<thead>
							<tr>
								<th></th>
								<th>用戶名</th>
								<th>密碼</th>
								<th>信箱</th>
								<th>暱稱</th>
								<th>性別</th>
								<th></th>
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
										<img src='images/user_default.jpg' height='100px', width='100px' />
									</td>
									<td><?php echo $_smarty_tpl->tpl_vars['row']->value['username'];?>
</td>
									<td><?php echo $_smarty_tpl->tpl_vars['row']->value['password'];?>
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
									<td>
										<a href="editUser.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
" title='Edit user' class='icon'>
											<button class='btn btn-outline-secondary'>
												<i class='fa fa-pencil'></i>
											</button>
										</a>
										<a href="deleteUser.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
" title='Delete user' class='icon'>
											<button class='btn btn-outline-secondary'>
												<i class='fa fa-trash'></i>
											</button>
										</a>
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
