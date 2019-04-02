<?php
include_once('main.php');
include_once('isLogin.php');

$link = mysqli_connect(db_host, db_user, db_password, db_name);
$sql = "SELECT `id` FROM User";
$str = "";
for ($i = 0; $i < 100; $i++)
	$str = $str . "0";

if ($result = mysqli_query($link, $sql)) {
	while ($row = mysqli_fetch_assoc($result)) {
		$user_id = $row['id'];
		$sql2 = "INSERT INTO UserAsset (`user_id`, `money`, `bonus`, `ownAcc`, `hairId`, `suitId`, `shoeId`) VALUES ('$user_id', '1000', '0', '$str', '0', '0', '0')";
		echo $sql2 . "<br>";
		mysqli_query($link, $sql2);
	}
}
echo "Finished";
?>