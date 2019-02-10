<?php

    $filename = "../documents/shishicai.txt";
    
    $handle = fopen($filename, "r");

    echo "var resultArr = {};";

    if ($handle) {
        $i=0;
        while (($line = fgets($handle)) !== false) {
            $line=str_replace("\r\n","",$line);
            
            //echo "line = $line";
            if ($i%2==0) {
                echo "resultArr['$line'] = ";
            }
            else{
                echo "'$line';";
            }
            $i++;
        }
        
        fclose($handle);
    } else {
        // error opening the file.
    } 
    fclose($handle);
?>