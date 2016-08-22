<?php
//这个程序包含了一些函数，用来转换不同的编码，以使得你的blog可以接受来自其他编码的trackback而不显示乱码
//这个程序的工作前提是服务器配置中打开了iconv()选项
function gb2utf ($string) {
	$out = iconv ( "gbk", "UTF-8" , $string);
	return $out;
}

function big2utf ($string) {
	$out = iconv ( "big5", "UTF-8" , $string);
	return $out;
}

function utf2gb ($string) {
	$out = iconv (  "UTF-8" ,"gbk", $string);
	return $out;
}

function utf2big ($string) {
	$out = iconv ( "UTF-8" ,  "big5", $string);
	return $out;
}
