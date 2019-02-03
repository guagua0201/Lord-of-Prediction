<?php


echo "HI"



$doc = new DOMDocument();

//$file = "/home/qeayg91ioeue/public_html/script/testScript.php";

$file = "localhost/script/testScript.php"

if($doc->loadHTMLFile($file)){
	echo "OK"
	/*$span = $doc->getElementsByTagName("span")->item(0);
	$count = $span->textContext;
	$count++;

	$doc->getElementsByTagName("span")->item(0)->nodeValue = $count;

	echo "hihi!";*/
}
else{
	return false;
}


?>