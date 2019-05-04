<?php
function logout() {
	// connect database
	$link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
		header('Location: error.php?error_code=102');
		exit(0);
	}

	// delete from online user
	$sql = "DELETE FROM `OnlineUser` WHERE `user_id` = '" . $_SESSION['user_id'] . "'";
	if (!mysqli_query($link, $sql)) {
		header('Location: error.php?error_code=101');
		mysqli_close($link);
		exit(0);
	}

	// unset session variables
	unset($_SESSION['user_id']);
	unset($_SESSION['username']);
	unset($_SESSION['user_timestamp']);

	// logout & redirect to index
	header('Location: index.php');
}
?>