<?php
include_once('main.php');
include_once('isLogin.php');
include_once('php/logout.php');

if ($log_status !== 0) {
	logout();
} else {
	header('Location: error.php?error_code=104');
}
?>