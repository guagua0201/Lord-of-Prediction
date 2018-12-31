<?php
require_once('Excelreader/reader.php');

$data = new Spreadsheet_Excel_Reader();
$data->setOutputEncoding('UTF-8');
$data->read('documents/test.xls');
?>
<table>
<?php
	for ($i = 1; $i <= $data->sheets[0]['numRows']; $i++) {
		echo "<tr>";
		for ($j = 1; $j <= 4; $j++) {
			echo "<td>" . $data->sheets[0]['cells'][$i][$j] . "</td>";
		}
		echo "</tr>";
	}
?>
</table>