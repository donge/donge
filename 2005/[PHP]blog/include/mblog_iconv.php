<?php
//������������һЩ����������ת����ͬ�ı��룬��ʹ�����blog���Խ����������������trackback������ʾ����
//�������Ĺ���ǰ���Ƿ����������д���iconv()ѡ��
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
