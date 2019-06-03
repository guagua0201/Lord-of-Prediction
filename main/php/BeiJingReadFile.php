<?php

    $filename = "../documents/BeiJingCart.txt";
    
    $handle = fopen($filename, "r");

    echo "var periodArr = [];";
    echo "var timeArr = [];";
    echo "var wordArr = [];";
    echo "var rankArr = [];";

    if ($handle) {
        $i=0;
        while (($line = fgets($handle)) !== false) {
            $line=str_replace("\r\n","",$line);
            $line = str_replace(array("\r","\n"),"",$line);
            $line=str_replace("\n","",$line);
            $line=str_replace("\r","",$line);
            
            //echo "line = $line";
            $i4 = floor($i/4);
            if ($i%4==0) {
                echo "periodArr[$i4] = $line;";
            }
            else if($i%4==1){
                echo "timeArr[$i4] = '$line';";
            }
            else if($i%4==2){
                $wordArr = explode(" ", $line);
                echo "wordArr[$i4] = [];";
                for ($j = 0;$j < 7; $j++){
                    $f = $wordArr[$j];
                    echo "wordArr[$i4][$j] = '$f';";
                }
            }
            else{
                $rankArr = explode(" ", $line);
                echo "rankArr[$i4] = [];";
                for ($j = 0;$j < 10; $j++){
                    $f = $rankArr[$j];
                    echo "rankArr[$i4][$j] = $f;";
                }
            }
            $i++;
        }
        
        fclose($handle);
    } else {
        // error opening the file.
    } 
    
?>