<?php
/* Smarty version 3.1.33, created on 2019-01-12 15:49:04
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c39fe60936a14_17007942',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e155717735a649acb1274d1f5c83f1994dde9d8a' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/templates/login.tpl',
      1 => 1546196441,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c39fe60936a14_17007942 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_12672140255c39fe609353b1_48045221', 'body');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, 'route.tpl');
}
/* {block 'body'} */
class Block_12672140255c39fe609353b1_48045221 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'body' => 
  array (
    0 => 'Block_12672140255c39fe609353b1_48045221',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div style='text-align: center; min-height: 68vh; padding: 20px 0' class='container'>
		<div style='height: 100%; width: 50%; margin: 0 auto'>
			<div class='login_box' style='margin-top: 0'>
				<img src='images/logo.jpg' height='200px' />
			</div>
			<div class='login_box'>
				<h1>登入</h1>
			</div>
			<div class='login_box'>
				<form method='POST' action='/login.php'>
					<div class='input-group mb-3 input-group-lg'>
						<div class="input-group-prepend">
    						<span class="input-group-text">帳號:</span>
    					</div>
						<input type='text' id='username' name='username' placeholder='請輸入帳號' class='form-control form-control-lg' />
					</div>
					<div class='input-group mb-3 input-group-lg'>
						<div class="input-group-prepend">
    						<span class="input-group-text">密碼:</span>
    					</div>
						<input type='password' id='password' name='password' placeholder='請輸入密碼' class='form-control form-control-lg' />
					</div>
					<div class='input-group mb-3 input-group-lg'>
						<button type='submit' style='width: 100%' class='btn btn-dark btn-lg'>確認</button>
						<input type='hidden' name='submit' value='submit' />
					</div>
				</form>
			</div>
			<div class='login_box row'>
				<div class='col-sm-6'>
					<a href='/'>忘記密碼</a>
				</div>
				<div class='col-sm-6'>
					<a href='/register.php'>立即註冊</a>
				</div>
			</div>
		</div>
	</div>
<?php
}
}
/* {/block 'body'} */
}
