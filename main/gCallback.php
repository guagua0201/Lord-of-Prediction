<?php
require_once('main.php');
require_once('isLogin.php');
require_once('configs/gConfig.php');

if (isset($_GET['code'])) {
	$token = $gClient->fetchAccessTokenWithAuthCode($_GET['code']);
	$_SESSION['access_token'] = $token;
}

$oAuth = new Google_Service_Oauth2($gClient);
$userData = $oAuth->userinfo_v2_me->get();

// echo "<pre>";
// var_dump($userData);
// echo "</pre>";

$link = mysqli_connect(db_host, db_user, db_password, db_name);
if (!$link) {
	die('Connection failed ' . mysqli_connect_error());
}
$email = $userData['email'];
$sql = "SELECT * FROM User WHERE email = '$email'";
// echo $sql;
$result = mysqli_query($link, $sql);
if (mysqli_num_rows($result) == 1) {
	$row = mysqli_fetch_assoc($result);
	$_SESSION['user_id'] = $row['id'];
	$_SESSION['username'] = $row['username'];
	mysqli_close($link);
	header('Location: /index.php');
} else {
	$_SESSION['email'] = $email;
	$_SESSION['nickname'] = $userData['name'];
	header('Location: /register.php?gRegister=1');
}
?>