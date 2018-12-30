<?php
/* Smarty version 3.1.33, created on 2018-12-30 21:11:28
  from '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/addArticle.php' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c292670f3bfd0_22222953',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a7a0571349bb6088a56a3cee019b8446068751fd' => 
    array (
      0 => '/home/justin/Desktop/Code/Work/Lord-of-Prediction/main/addArticle.php',
      1 => 1546200677,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c292670f3bfd0_22222953 (Smarty_Internal_Template $_smarty_tpl) {
echo '<?php
';?>include_once('main.php');
include_once('isLogin.php');

$smarty->assign('member', $member);
$smarty->assign('log_status', $log_status);

if ($log_status) {
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
	}
	$sql = "SELECT id, name FROM Category";
	$data = array();
	if ($result = mysqli_query($link, $sql)) {
		while ($row = mysqli_fetch_assoc($result))
			$data[] = $row;
	}
	$smarty->assign('data', $data);
	$smarty->display('addArticle.php');
	if (isset($_POST['submit'])) {
	}
} else {
	header('Location: /login.php');
}
<?php echo '?>';
}
}
