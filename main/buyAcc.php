<?php

    include_once('main.php');
    include_once('isLogin.php');
    require_once('/configs/config.php');
    header('Content-Type: application/json');


    
    $aResult = array();

    

    if( !isset($_POST['arguments']) ) { 
        $aResult['error'] = 'No function arguments!';
        echo json_encode($aResult);
        exit();
    }
    if($log_status == 0){
        $aResult['error'] = 'not login!';
        exit();
    }
    if($member != $_POST['arguments'][0]){
        $aResult['error'] = "wrong user!";
        exit();
    }


    $link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
        //die('Connection failed ' . mysqli_connect_error());
        $aResult['error'] = "die";
        echo json_encode($aResult);
    }
    else{
        $sql = "SELECT id,money1,money2,money3,ownAcc FROM user WHERE username = '" . $_POST['arguments'][0] . "'";
        

        $user = mysqli_fetch_assoc(mysqli_query($link, $sql));

        if (mysqli_num_rows($user) == 1) {
            
        }
        else{
            
        }

        $moneyType = "money".$_POST['arguments'][3];

        if($user["$moneyType"] < $_POST['arguments'][2]) {
            $aResult['error'] = "你是個窮B! ".$moneyType." , ".$user["$moneyType"]." , ".$_POST['arguments'][2];
            echo json_encode($aResult);
            exit;
        }

        $ownAcc = $user['ownAcc'];

        if($ownAcc[$_POST['arguments'][1]] == '1'){
            $aResult['error'] = '你已經有了!';
            echo json_encode($aResult);
            exit;
        }


        $ownAcc[$_POST['arguments'][1]] = '1';
        //$aResult['error'] = $ownAcc;
    //    echo json_encode($aResult);
      //  exit;

        $newMoney = $user["$moneyType"]-$_POST['arguments'][2];

        $query = "UPDATE user SET "."$moneyType"." = "."$newMoney".", ownAcc = "."\"$ownAcc\""." WHERE id = ".$user["id"];

        //$query = "UPDATE user SET "."$moneyType"." = "."$newMoney".", ownAcc = "."$ownAcc"." WHERE id = ".'$user["id"]';
        
        mysqli_query($link, $query);

        mysqli_close($link);
        $aResult['leftMoney'] = $newMoney;
        echo json_encode($aResult);
    }

?>