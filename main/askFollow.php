<?php
include_once('main.php');
include_once('isLogin.php');
require_once('../configs/config.php');
header('Content-Type: application/json');


if ($log_status == 0) {
    $aResult['error'] = 'not login!';
    exit();
}
if(!isset($_POST['arguments'])){
    $aResult['error'] = 'No function arguments!';
    exit();
}
if($member != $userA){
    $aResult['error'] = 'user wrong!';
    exit();
}
$userA = $_POST['arguments'][0];

$link = mysqli_connect(db_host,db_user,db_password,db_name);

if(!$link){
    $aResult['error'] = "die";
}
else{
    $sql = "select userB from follower where userA = '$userA'";
    $result = mysqli_query($link,$sql);
    $followList = array();
    while($row = mysqli_fetch_assoc($result)){
        array_push($followList,$row['userB']);
    }
    
    $aResult['result'] = $followList;
}

echo json_encode($aResult);




?>