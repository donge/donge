<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
$n=$_GET['n'];
$n=trim(preg_replace("/[a-z][A-Z]/", "", $n));

$plus=date("n", time())*date("d",time())+date("Y",time());
$cnow=$n-$plus;
$imagefile="../img/validate/$cnow.gif";
$fp=@fopen($imagefile,'rb');
$outputimg=@fread($fp,filesize($imagefile));
@fclose($fp);
@header("content-type:image/gif");
echo $outputimg;
?>