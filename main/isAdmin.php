<?php
session_start();
$member = "Guest";
$log_status = false;
$is_admin = false;

if (isset($_SESSION['user_id'])) {
	$member = $_SESSION['username'];
	$log_status = true;
}

// Check Admin !!!!
if ($member === 'justin') {
	$is_admin = true;
}
?>