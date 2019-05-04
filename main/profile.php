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

    if(!isset($target)){
        $sql = "SELECT gender,id FROM User WHERE username = '$member'";
        if($result = mysqli_query($link, $sql)){
            while($row = $result->fetch_assoc()) {
                $smarty->assign('member',$member);
                $smarty->assign('gender',$row["gender"]);
                $smarty->assign('userID',$row["id"]);
            }
            $smarty->assign('isSelf',1);
            $smarty->display('profile.tpl');    
        }
        else{
            echo "$sql";
            //error sql
        }
    }
    else{
        $sql = "SELECT gender,id FROM User WHERE username = '$target'";
        if($result = mysqli_query($link,$sql)){
            while($row = $result->fetch_assoc()){
                $smarty->assign('gender',$row["gender"]);
                $smarty->assign('user',$target);
                $smarty->assign('userID',$row["id"]);
                
            }
        }
        $sql = "SELECT id FROM User WHERE username = '$member'";
        if($result = mysqli_query($link, $sql)){
            while($row = $result->fetch_assoc()) {
                $smarty->assign('member',$member);
                $smarty->assign('idSelf');
                //$smarty->assign('genderSelf',$row["gender"]);
            }
        }
        $smarty->assign('isSelf',0);

        $smarty->display('profileOther.tpl');
    }
    
    
}
?>