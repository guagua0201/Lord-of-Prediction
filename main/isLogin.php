<?php
session_start();
$member = "Guest";
$log_status = 0;

if (isset($_SESSION['user_id'])) {
	$member = $_SESSION['username'];
	$log_status = 1;
}

// set admin account
if ($member === 'justin' || $member === 'toby') {
	$log_status = 2;
}
?>