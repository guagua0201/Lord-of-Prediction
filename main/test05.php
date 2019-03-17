<?php
include_once('main.php');
include_once('isLogin.php');

echo "$log_status";
echo "<br>";
if ($log_status != 0){
    $link = mysqli_connect(db_host, db_user, db_password, db_name);
    if (!$link) {
		die('Connection failed ' . mysqli_connect_error());
    }
    else{
        echo "OK!";
    }
    $sql = "SELECT id,gender,email FROM user WHERE username = '$member'";
    echo "check";
    $result = mysqli_query($link, $sql);
    //$result = $line->query($sql);
    echo "hello"."<br>";
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "id: " . $row["id"]. " - Gender: " . $row["gender"] . "<br>";
            echo "email: ". $row["email"] . "<br>";
            $smarty->assign('member',$member);
            $smarty->assign('email',$row["email"]);
        }
        $smarty->display("test05.tpl");
    } else {
        echo "0 results";
    }
}

?>