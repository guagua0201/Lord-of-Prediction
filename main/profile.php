<?php
include_once('main.php');
include_once('isLogin.php');
if (!$log_status) {
    header("Location: login.php"); 
    exit;
}
else{
    $link = mysqli_connect(db_host, db_user, db_password, db_name);
    if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
    }
    
    $sql = "SELECT gender FROM user WHERE username = '$member'";
    $result = mysqli_query($link, $sql);
    while($row = $result->fetch_assoc()) {
        $smarty->assign('member',$member);
        $smarty->assign('gender',$row["gender"]);
    }


    $smarty->display('profile.tpl');
}
?>