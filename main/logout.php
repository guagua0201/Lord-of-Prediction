<?php
require_once('configs/config.php');
session_start();

if (isset($_SESSION['user_id'])) {
	unset($_SESSION['user_id']);
	unset($_SESSION['username']);
	unset($_SESSION['user_timestamp']);
	session_destroy();
	header('Location: /index.php');
}
?>