<?php
include_once('main.php');
include_once('isLogin.php');

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die('Connection failed ' . mysqli_connect_error());
}

$sql = "SELECT * FROM User";
if (isset($_GET['search']) && !empty($_GET['search'])) {
	$search = mysqli_real_escape_string($link, trim($_GET['search']));
	$sql = "SELECT * FROM User WHERE username LIKE '%" . $search . "%' OR nickname LIKE '%" . $search . "%'";
	// echo $sql;
}
$data = array();
if ($result = mysqli_query($link, $sql)) {
	while ($row = mysqli_fetch_assoc($result))
		$data[] = $row;
}
mysqli_close($link);
// echo gettype($data);
$smarty->assign('data', $data);
$smarty->display('searchUser.tpl');
?>