<?php
    require_once('../configs/config.php');
    header('Content-Type: application/json');

    $aResult = array();

    

    if( !isset($_POST['arguments']) ) { $aResult['error'] = 'No function arguments!'; }


    /*if( !isset($aResult['error']) ) {

        switch($_POST['functionname']) {
            case 'add':
               if( !is_array($_POST['arguments']) || (count($_POST['arguments']) < 2) ) {
                    
                   $aResult['error'] = 'Error in arguments!';
               }
               else {
                    $aResult['result'] = $_POST['arguments'][0] + $_POST['arguments'][1];
               }
               break;

            default:
               $aResult['error'] = 'Not found function '.$_POST['functionname'].'!';
               break;
        }

    }*/

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
    

    echo json_encode($aResult);

?>