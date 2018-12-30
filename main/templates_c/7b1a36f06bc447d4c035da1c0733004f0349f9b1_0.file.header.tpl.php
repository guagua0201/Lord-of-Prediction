<?php
/* Smarty version 3.1.33, created on 2018-12-30 16:29:09
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c28e445f376c8_25897543',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7b1a36f06bc447d4c035da1c0733004f0349f9b1' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/header.tpl',
      1 => 1546183748,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c28e445f376c8_25897543 (Smarty_Internal_Template $_smarty_tpl) {
?><div style='min-height: 25vh'>
	<div style='background-color: #080808; height: 150px; padding: 15px 0' class='jumborton'>
		<div style='width: 100%' class='row'>
			<div class='col-sm-10'>
				<a href='/' title='Home'>
					<img src='/images/logo.jpg' height='100%' width='200px' />
				</a>
			</div>
			<div class='col-sm-1'>
				<table style='line-height: 25px'>
					<tr>
						<td>
							<?php if ($_smarty_tpl->tpl_vars['log_status']->value == true) {?>
								<a href='/' title='Profile'><?php echo $_smarty_tpl->tpl_vars['member']->value;?>
</a>
							<?php } else { ?>
								<a href='/login.php' title='Login'>登入</a>
							<?php }?>
						</td>
					</tr>
					<tr>
						<td>
							<?php if ($_smarty_tpl->tpl_vars['log_status']->value == false) {?>
								<a href='/register.php' title='Register'>註冊</a>
							<?php } else { ?>
								<a href='/logout.php' title='Logout'>登出</a>
							<?php }?>
						</td>
					</tr>
					<tr>
						<td>
							<a href='/' title='Contact'>連繫客服</a>
						</td>
					</tr>
					<tr>
						<td>
							<a href='/' title='Shop'>商城入口</a>
						</td>
					</tr>
				</table>
			</div>
			<div class='col-sm-1'>
				<table style='line-height: 25px'>
					<?php if ($_smarty_tpl->tpl_vars['log_status']->value == true) {?>
						<tr>
							<td>
								<a href='/' title='Profile'>個人小屋</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href='/' title='StoreValue'>儲值入口</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href='/' title='ShoppingCar'>購物車</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href='/' title='Message'>訊息中心</a>
							</td>
						</tr>
					<?php }?>
				</table>
			</div>
		</div>
	</div>

	<nav style="margin-bottom: 20px; padding: 10px 30px;" class="navbar bg-dark navbar-dark navbar-expand-sm">
	  <ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="/">預測賽事</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/searchArticle.php">討論區</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/">小遊戲</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/">找高手</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/">即時比分</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/searchUser.php">用戶搜尋</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="./">歷史數據</a>
		</li>
	  </ul>
	</nav>
</div><?php }
}
