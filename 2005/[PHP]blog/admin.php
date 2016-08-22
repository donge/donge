<?
error_reporting(E_ERROR | E_WARNING | E_PARSE);
@header("Content-Type: text/html; charset=utf-8");
$start=$_REQUEST['start'];
if ($start) {
	$startpage="admin_cp.php?job=$start";
	$startpage=str_replace(":and:", "&", $startpage);
	$startpage=str_replace(":equals:", "=", $startpage);
} else {
	$startpage="admin_cp.php?job=change";
}
?>
<HTML>
<HEAD>
<TITLE>Bo-Blog -- Admin Center</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
.navPoint {
	COLOR: white; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt
}
</style>
<SCRIPT>
function switchSysBar(){
	if (switchPoint.innerText==3){
		switchPoint.innerText=4
		document.all("frmTitle").style.display="none"
	}
	else{
		switchPoint.innerText=3
		document.all("frmTitle").style.display=""
	}
}
</SCRIPT>
</HEAD>
<BODY bgColor=#47637E scroll=no style="MARGIN: 0px">
<TABLE border=0 cellPadding=0 cellSpacing=0 height="100%" width="100%">
  <TBODY>
    <TR> 
      <TD align=middle id=frmTitle noWrap vAlign=center name="fmTitle"><IFRAME 
      frameBorder=0 id=left name=left src="admin_left.php" 
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 200px; Z-INDEX: 2" scrolling="vertical"></IFRAME> 
      <TD bgColor=#47637E style="WIDTH: 10pt"> <TABLE border=0 cellPadding=0 cellSpacing=0 height="100%">
          <TBODY>
            <TR> 
              <TD onclick=switchSysBar() style="HEIGHT: 100%"><SPAN class=navPoint 
            id=switchPoint title='Display/Hide the Sidebar'>3</SPAN></TD>
            </TR>
          </TBODY>
        </TABLE></TD>
      <TD style="WIDTH: 100%"><IFRAME frameBorder=0 id=frmright name=frmright 
      scrolling=auto src="<?=$startpage?>" 
      style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"> </IFRAME></TD>
    </TR>
  </TBODY>
</TABLE>
</BODY>
</HTML> 