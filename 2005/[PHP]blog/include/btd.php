<?
//Bob's TXT-DB 操作函数库

function btd_find ($datafile, $datazone, $datacomparison, $once=1) {
	$found_num=0;
	$data_array=btd_file_location($datafile);
	for ($i=0; $i<count($data_array); $i++) {
		$cur_data_line=@explode("|", $data_array[$i]);
		if ($cur_data_line[$datazone]==$datacomparison) {
			$found_num+=1;
			$found_index=$i;
			if ($once==1) break;
		}
	}
	if ($found_num==0) {
		return false;
	} else {
		return array ("fnum"=>$found_num, "findex"=>$found_index);
	}
}

function btd_change($datafile, $datazone_array, $data_to_array, $once=1) {
	$data_array=btd_file_location($datafile);
	$array_count=count($datazone_array);
	for ($i=0; $i<count($data_array); $i++) {
		$cur_data_line=@explode("|", $data_array[$i]);
		$j=0;
		while ($j<$array_count) {
			$for_index=$datazone_array[$j];
			$cur_data_line[$for_index]=$data_to_array[$j];
			$j++;
		}
		$data_array[$i]=@implode("|",$cur_data_line);
		if ($once==1) break;
	}
	$new_data=@implode("",$data_array);
	btd_rewrite($datafile, $new_data);
}


function btd_rewrite ($datafile, $newdata, $method="w") {
	global $writefilenum;
	$filenum=fopen($datafile, $method);
	flock($filenum,LOCK_EX);
	$rewrite_outcome=fwrite($filenum,$newdata);
	fclose($filenum);
	$writefilenum+=1;
	return $rewrite_outcome;
}
	
function btd_file_location ($datafile) {
	if (file_exists ($datafile)) {
		$return_data=@file($datafile);
		return $return_data;
	}
	else return false;
}

$array1=array (2);
$array2=array ("使用中的一些技巧");
$array3=array ("使用中的一些小技巧" );
$tmp=btd_change("newart/list.php", $array1,$array2,1,1,$array3);
//echo $tmp["fnum"];
//echo "<br>".$tmp["findex"];