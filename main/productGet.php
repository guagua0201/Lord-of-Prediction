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
    	if(!$link){
    		$aResult['error'] = "die";
    	}
    	else{

            for($i=0;$i<200;$i++){
                if($_POST['arguments'][0][$i] == '1'){
                    $id = $i+1;
                    $sql = "SELECT gender,category_id from `Product` where id = $id";
                    if($result = mysqli_query($link,$sql)){
                        $product = mysqli_fetch_assoc($result);
                        $aResult[$id]['gender'] = $product['gender'];
                        $aResult[$id]['category'] = $product['category_id'];
                        $nowCate = $aResult[$id]['category'];
                        $sql2 = "SELECT e_name from `ProductCategory` where id = $nowCate";
                        if($result2 = mysqli_query($link,$sql2)){
                            $ename = mysqli_fetch_assoc($result2);  
                            $aResult[$id]['cate_ename'] = $ename['e_name'];
                        }
                        
                    }
                    else{
                        $aResult['error'] = "sql fail";
                        break;
                    }
                }
            }
    		/*$id = $_POST['arguments'][0];
    		$sql = "SELECT gender,category_id from `Product` where id = $id";


    		if($result = mysqli_query($link,$sql)){
    			$product = mysqli_fetch_assoc($result);
    			$aResult['gender'] = $product['gender'];
    			$aResult['category'] = $product['category_id'];
    			$nowCate = $aResult['category'];
    			$sql2 = "SELECT e_name from `ProductCategory` where id = $nowCate";
    			if($result2 = mysqli_query($link,$sql2)){
    				$ename = mysqli_fetch_assoc($result2);	
    				$aResult['cate_ename'] = $ename['e_name'];
    			}
    			
    		}
    		else{
    			$aResult['error'] = "sql fail";
    		}*/
    	}
    }

    echo json_encode($aResult);

?>