<?php
    require_once('../configs/config.php');
    header('Content-Type: application/json');

    $aResult = array();

    
    
    if( !isset($_POST['functionname']) ) { $aResult['error'] = 'No function name!'; }

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
        $aResult['result'] = "die";
    }
    else{
        $sql = "SELECT gender FROM user WHERE username = '" . $_POST['arguments'][0] . "'";
        $user_gender = mysqli_fetch_assoc(mysqli_query($link, $sql));
        $aResult['result'] = $user_gender['gender'];
    }
    

    echo json_encode($aResult);

?>