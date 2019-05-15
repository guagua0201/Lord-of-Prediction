<?php
    require_once('configs/config.php');
    include_once('main.php');
    include_once('isLogin.php');
    header('Content-Type: application/json');

    $aResult = array();


    
    


    if( !isset($_POST['arguments']) ) { 
        $aResult['error'] = 'No function arguments!'; 
    }
    else {

        $link = mysqli_connect(db_host, db_user, db_password, db_name);
        if (!$link) {
            //die('Connection failed ' . mysqli_connect_error());
            $aResult['error'] = "die";
        }
        else{

            $memberName = $_POST['arguments'][0];
            $mode = $_POST['arguments'][1];    

            if ( $mode == 1 ){ // self
                if ( $member != $memberName ){
                    $aResult['error'] = 'Can\'t get information from other user!';
                }
                else{
                    // ownAcc
                    $sql = "SELECT ownAcc FROM `User` where username = \"$member\"";
                    if($result = mysqli_query($link,$sql)){
                        if(mysqli_num_rows($result)!=1){
                            $aResult['error'] = 'sql rows not equal one';
                        }
                        else{
                            $nowResult = mysqli_fetch_assoc($result);
                            $aResult['ownAcc'] = $nowResult['ownAcc'];
                        }
                    }
                    else{
                        $aResult['error'] = "sql fail";
                    }
                }
            }

            $sql = "SELECT selectAcc,gender FROM `User` where username = \"$member\"";
            if($result = mysqli_query($link,$sql)){
                if(mysqli_num_rows($result)!=1){
                    $aResult['error'] = 'sql rows not equal one';
                }
                else{
                    $nowResult = mysqli_fetch_assoc($result);
                    $aResult['selectAcc'] = $nowResult['selectAcc'];
                    $aResult['gender'] = $nowResult['gender'];
                }
            }
            else{
                $aResult['error'] = "sql fail";
            }

            // selectAcc

            //gender    
        }
        

    }

    echo json_encode($aResult);


    


    /*
    $link = mysqli_connect(db_host, db_user, db_password, db_name);
    if (!$link) {
        //die('Connection failed ' . mysqli_connect_error());
        $aResult['error'] = "die";
    }
    else{
        $sql = "SELECT gender,ownAcc,hairID,suitID,shoeID FROM user WHERE username = '" . $_POST['arguments'][0] . "'";
        $user = mysqli_fetch_assoc(mysqli_query($link, $sql));

        $arr = ['gender','ownAcc','hairID','suitID','shoeID'];

        for ( $i = 0; $i < 5;$i++){
            $aResult[$arr[$i]] = $user[$arr[$i]];
        }
        //$aResult['gender'] = $user['gender'];
        //$aResult['ownAcc'] = $user['ownAcc'];
        //$aResult['hairID'] = $user['hairID'];


        $products = "";
        $aResult['yesCnt'] = 0;
        for ($i=0;$i<200;$i++){ // the products number should < 200
            $sql = "SELECT category_id FROM product WHERE id = '$i'";    
            
            //$result = mysqli_query($link,$sql);
            //$product = mysqli_fetch_assoc($result);
            //$aResult["cate".$i] = $product["price"];
            
            if($result = mysqli_query($link,$sql)) {
                if(mysqli_num_rows($result) == 0){
                    $products = $products."0";
                }
                else{
                    $product = mysqli_fetch_assoc($result);
                    $products = $products.$product["category_id"];
                    $aResult['yesCnt']++;
                }
            }
            else{
                $products = $products."0";
            }
            
        }
        $aResult["productCate"] = $products;

        mysqli_close($link);
       
    }
    

    echo json_encode($aResult);*/

?>