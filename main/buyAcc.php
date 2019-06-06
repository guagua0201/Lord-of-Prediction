<?php

    
    include_once('main.php');
    include_once('isLogin.php');
    require_once('configs/config.php');
    header('Content-Type: application/json');


    $aResult = array();

    

    if( !isset($_POST['arguments']) ) { 
        $aResult['error'] = 'No function arguments!';
        echo json_encode($aResult);
        exit();
    }
    if($log_status == 0){
        $aResult['error'] = 'not login!';
        echo json_encode($aResult);
        exit();
    }
    if($member != $_POST['arguments'][0]){
        $aResult['error'] = "wrong user!";
        echo json_encode($aResult);
        exit();
    }


    $link = mysqli_connect(db_host, db_user, db_password, db_name);
	if (!$link) {
        //die('Connection failed ' . mysqli_connect_error());
        $aResult['error'] = "die";
        echo json_encode($aResult);
    }
    else{
        $sql = "SELECT id,money1,money2,money3,ownAcc,gender FROM `User` WHERE username = '" . $_POST['arguments'][0] . "'";
        
        if($result = mysqli_query($link, $sql)){
            $user = mysqli_fetch_assoc($result);    
        }
        else{
            $aResult['error'] = "database error, $sql";
            echo json_encode($aResult);
            exit();
        }

        $sql = "SELECT gender,price,moneyType FROM `Product` WHERE id = " . $_POST['arguments'][1] ;

        if($result = mysqli_query($link,$sql)){
            $product = mysqli_fetch_assoc($result);
        }
        else{
            $aResult['error'] = "database error, $sql";
            echo json_encode($aResult);
            exit();
        }

        //$moneyType = "money".$_POST['arguments'][3];
        if( (!isset($product['moneyType'])) || (!isset($product['price'])) ) {
            $aResult['error'] = "product error, $sql";
            echo json_encode($aResult);
            exit();
        }
        $moneyType = "money".$product['moneyType'];
        $price = $product['price'];
        if($user["$moneyType"] < $price) {
            $aResult['errorMoneyType'] = $moneyType;
            $aResult['errorPrice'] = $price;
            $aResult['error'] = "你是個窮B! ".$moneyType." , ".$user["$moneyType"]." , ".$price;
            echo json_encode($aResult);
            exit;
        }

        $gender = $product['gender'];


        if($user["gender"] != $gender){
            $aResult['error'] = "wrong gender!";
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

        $newMoney = $user["$moneyType"]-$price;

        

        $query = "UPDATE `User` SET "."$moneyType"." = "."$newMoney".", ownAcc = "."\"$ownAcc\""." WHERE id = ".$user["id"];



        //$query = "UPDATE user SET "."$moneyType"." = "."$newMoney".", ownAcc = "."$ownAcc"." WHERE id = ".'$user["id"]';
        
        mysqli_query($link, $query);

        mysqli_close($link);
        $aResult['leftMoney'] = $newMoney;
        echo json_encode($aResult);
    }

?>