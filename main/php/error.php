<?php
function throw_error($error_code, $error_msg) {
	if (isset($link) && mysqli_ping($link))
		mysqli_close($link);
	header('Location: error.php?error_code=' . $error_code. '&msg=' . $error_msg);
	exit(1);
}
?>
