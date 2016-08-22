<?
@header("Content-Type: text/html; charset=utf-8");
require ("poplang.php");
echo<<<eot
<html style="width: 398; height: 280">

<head>
  <title>$langaer[31]</title>

<script type="text/javascript" src="popup.js"></script>

<script type="text/javascript">

function Init() {
  __dlg_init();
  document.getElementById("f_rows").focus();
};

function onOK() {
  var required = {
    "f_rows": "You must enter a number of rows",
    "f_cols": "You must enter a number of columns"
  };
  for (var i in required) {
    var el = document.getElementById(i);
    if (!el.value) {
      alert(required[i]);
      el.focus();
      return false;
    }
  }
  var fields = ["f_rows", "f_cols", "f_width", "f_unit",
                "f_align", "f_border", "f_spacing", "f_padding"];
  var param = new Object();
  for (var i in fields) {
    var id = fields[i];
    var el = document.getElementById(id);
    param[id] = el.value;
  }
  __dlg_close(param);
  return false;
};

function onCancel() {
  __dlg_close(null);
  return false;
};

</script>

<style type="text/css">
html, body {
  background: ButtonFace;
  color: ButtonText;
  font: 11px Tahoma,Verdana,sans-serif;
  margin: 0px;
  padding: 0px;
}
body { padding: 5px; }
table {
  font: 11px Tahoma,Verdana,sans-serif;
}
form p {
  margin-top: 5px;
  margin-bottom: 5px;
}
.fl { width: 9em; float: left; padding: 2px 5px; text-align: right; }
.fr { width: 7em; float: left; padding: 2px 5px; text-align: right; }
fieldset { padding: 0px 10px 5px 5px; }
select, input, button { font: 11px Tahoma,Verdana,sans-serif; }
button { width: 70px; }
.space { padding: 2px; }

.title { background: #ddf; color: #000; font-weight: bold; font-size: 120%; padding: 3px 10px; margin-bottom: 10px;
border-bottom: 1px solid black; letter-spacing: 2px;
}
form { padding: 0px; margin: 0px; }
</style>

</head>

<body onload="Init()">

<div class="title">$langaer[31]</div>

<form action="" method="get">
<table border="0" style="padding: 0px; margin: 0px">
  <tbody>

  <tr>
    <td style="width: 4em; text-align: right">$langaer[32]</td>
    <td><input type="text" name="rows" id="f_rows" size="5" title="$langaer[33]" value="2" /></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td style="width: 4em; text-align: right">$langaer[34]</td>
    <td><input type="text" name="cols" id="f_cols" size="5" title="$langaer[35]" value="4" /></td>
    <td style="width: 4em; text-align: right">$langaer[36]</td>
    <td><input type="text" name="width" id="f_width" size="5" title="$langaer[37]" value="100" /></td>
    <td><select size="1" name="unit" id="f_unit" title="$langaer[38]">
      <option value="%" selected="1"  >$langaer[39]</option>
      <option value="px"              >$langaer[40]</option>
      <option value="em"              >Em</option>
    </select></td>
  </tr>

  </tbody>
</table>

<p />

<fieldset style="float: left; margin-left: 5px;">
<legend>$langaer[19]</legend>

<div class="space"></div>

<div class="fl">$langaer[20]</div>
<select size="1" name="align" id="f_align"
  title="Positioning of this image">
  <option value="" selected="1"                >$langaer[21]</option>
  <option value="left"                         >left</option>
  <option value="right"                        >right</option>
  <option value="texttop"                      >texttop</option>
  <option value="absmiddle"                    >absmiddle</option>
  <option value="baseline"                     >baseline</option>
  <option value="absbottom"                    >absbottom</option>
  <option value="bottom"                       >bottom</option>
  <option value="middle"                       >middle</option>
  <option value="top"                          >top</option>
</select>

<p />

<div class="fl">$langaer[41]</div>
<input type="text" name="border" id="f_border" size="5" value="1"
title="$langaer[42]" />
<!--
<p />

<div class="fl">Collapse borders:</div>
<input type="checkbox" name="collapse" id="f_collapse" />
-->
<div class="space"></div>

</fieldset>

<fieldset style="float:right; margin-right: 5px;">
<legend>$langaer[43]</legend>

<div class="space"></div>

<div class="fr">Spacing:</div>
<input type="text" name="spacing" id="f_spacing" size="5" value="1"
title="Space between adjacent cells" />

<p />

<div class="fr">Padding:</div>
<input type="text" name="padding" id="f_padding" size="5" value="1"
title="Space between content and border in cell" />

<div class="space"></div>

</fieldset>

<div style="margin-top: 85px; text-align: right;">
<hr />
<button type="button" name="ok" onclick="return onOK();">$langaer[10]</button>
<button type="button" name="cancel" onclick="return onCancel();">$langaer[11]</button>
</div>

</form>

</body>
</html>
eot;
?>