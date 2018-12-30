<?php
session_start();
$member = "Guest";
$log_status = false;

if (isset($_SESSION['user_id'])) {
	$member = $_SESSION['username'];
	$log_status = true;
}
?>