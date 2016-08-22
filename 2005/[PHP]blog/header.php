<?
@header("Content-Type: text/html; charset=utf-8");
?>
<html>
<style type="text/css">

BODY {
SCROLLBAR-FACE-COLOR: #FFFFFF;
 SCROLLBAR-HIGHLIGHT-COLOR: #EFF9FE;
 SCROLLBAR-SHADOW-COLOR: #006699;
 SCROLLBAR-3DLIGHT-COLOR: #EFF9FE;
 SCROLLBAR-ARROW-COLOR: #006699;
 SCROLLBAR-TRACK-COLOR: #EFF9FE;
 SCROLLBAR-DARKSHADOW-COLOR: #EFF9FE;
 SCROLLBAR-BASE-COLOR: #EFF9FE
}
option {
	font-family: "Verdana", "Arial";
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
	background-color: #EFF9FE;
}

td {
	font-family: "Verdana", "Arial", "Helvetica", "sans-serif";
	font-size: 9pt;
	text-decoration: none;
}
a {
	color: #006699;
	text-decoration: none;
}
a:hover {
	color: #000000;
	text-decoration: underline; 
}
input {
	font-family: "Verdana", "Arial";
	font-size: 9pt;
	color: #003366;
	background-color: #EAF4FD;
	border: 1px dotted #333333;
}
textarea {
	font-family: "Verdana", "Arial";
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
	background-color: #E9F2FC;
	border: none;
}

</style>
<?
if ($openw) print<<<eot
<style type="text/css">
@import url(htmlarea/htmlarea.css);
</style>

eot;

if ($go) {
	if ($go!="<back>") echo "<META HTTP-EQUIV='Refresh' CONTENT='3;URL=$go'>";
	else echo "<META HTTP-EQUIV='Refresh' CONTENT='3;URL=javascript:history.back(1)'>";
}
?>
<title><? 
echo (stripslashes($blogname));
if ($add_title) echo $add_title; ?>
</title>
<?
if ($openw) print<<<eot
<script type="text/javascript">
_editor_url = "htmlarea"; // omit the final slash 
</script> 
<!-- load the main HTMLArea files -->
<script type="text/javascript" src="htmlarea/htmlarea.js"></script>
<script type="text/javascript" src="htmlarea/lang/gb.js"></script>
<script type="text/javascript" src="htmlarea/dialog.js"></script>
<script type="text/javascript" src="htmlarea/popupwin.js"></script>
<script type="text/javascript">
var editor = null;
function initEditor() {
  editor = new HTMLArea("icontent");


  editor.generate();
  return false;
}
</script>

eot;
?>
</head>
<?
if (!$openw)
echo "<body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\">";
else echo "<body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\"  onload=\"initEditor()\">";
?>


<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign=top><table width="96%"  border="0" align="center" cellpadding="4" cellspacing="0">
        <tr> <td>
		<!-- this is where the content part locates -->
