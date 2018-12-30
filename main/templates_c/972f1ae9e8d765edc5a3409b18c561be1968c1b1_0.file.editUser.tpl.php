<?php
/* Smarty version 3.1.33, created on 2018-12-30 13:05:55
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/editUser.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c28b4a33ba537_76732238',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '972f1ae9e8d765edc5a3409b18c561be1968c1b1' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/editUser.tpl',
      1 => 1546171553,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c28b4a33ba537_76732238 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_9676338875c28b4a33b4d19_17639060', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_9676338875c28b4a33b4d19_17639060 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_9676338875c28b4a33b4d19_17639060',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="container" style="text-align: center; min-height: 68vh; padding: 30px 0">
		<?php echo '<script'; ?>
 src="/javascripts/register_form_check.js" type="text/javascript"><?php echo '</script'; ?>
>
		<div style="height: 100%; width: 70%; margin: 0 auto;">
			<form id="register_form" method="POST" action="/editUser.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
" onsubmit="return checkForm(this);">
				<input hidden readonly name='id' value = "<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
" />
				<div class="editUser_box" style='margin-top: 0'>
					<h1>用戶資訊修改</h1>
				</div>
				<div class="editUser_box">
					<p></p>
					<table style="width: 100%;">
						<tbody>
							<tr class="spaceUnder">
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="username" name="username" value="<?php echo $_smarty_tpl->tpl_vars['row']->value['username'];?>
" readonly />
										<p class="text-danger" id="username_notice" hidden="hidden">請填入帳號！</p>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="nickname" name="nickname" value="<?php echo $_smarty_tpl->tpl_vars['row']->value['nickname'];?>
" />
										<p class="text-danger" id="nickname_notice" hidden="hidden">請輸入暱稱！</p>
									</div>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="password" name="password" value="<?php echo $_smarty_tpl->tpl_vars['row']->value['password'];?>
" />
										<p class="text-danger" id="password_notice" hidden="hidden">請輸入密碼！</p>
									</div>
								</td>
								<td>
									<div class="form-group">
										<select class="form-control form-control-lg" id="gender" name="gender">
											<?php if ($_smarty_tpl->tpl_vars['row']->value['gender'] == 0) {?>
												<option value='0' selected>男</option>
												<option value='1'>女</option>
											<?php } else { ?>
												<option value='0'>男</option>
												<option value='1' selected>女</option>
											<?php }?>
										</select>
									</div>
								</td>
							</tr>
							<tr class="spaceUnder">
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="confirmed_pwd" name="confirmed-pwd" value="<?php echo $_smarty_tpl->tpl_vars['row']->value['password'];?>
" />
										<p class="text-danger" id="confirmed_notice" hidden="hidden">與密碼不符！</p>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input class="form-control form-control-lg" type="text" id="email" name="email" value="<?php echo $_smarty_tpl->tpl_vars['row']->value['email'];?>
" />
										<p class="text-danger" id="email_notice" hidden="hidden">請輸入合法的信箱！</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="editUser_box">
					<input class="form-check-input" type="checkbox" name="terms" checked hidden/>
				</div>
				<div class="editUser_box">
					<input type='hidden' name='submit' />
					<button class="btn btn-lg btn-dark" type="submit" style="width: 50%; float: right;">提交</button>
				</div>
			</form>
		</div>
	</div>
<?php
}
}
/* {/block 'body'} */
}
