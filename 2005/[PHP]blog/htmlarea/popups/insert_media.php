<?
@header("Content-Type: text/html; charset=utf-8");
require ("poplang.php");
echo<<<eot
<html style="width: 398; height: 280">

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>$langaer[27]</title>

<script type="text/javascript" src="popup.js"></script>

<script type="text/javascript">
var preview_window = null;

function Init() {
  __dlg_init();
  document.getElementById("f_url").focus();
};

function onOK() {
  var required = {
    "f_url": "You must enter the URL"
  };
  for (var i in required) {
    var el = document.getElementById(i);
    if (!el.value) {
      alert(required[i]);
      el.focus();
      return false;
    }
  }
  // pass data back to the calling window
  var fields = ["f_url", "f_auto", "f_width", "f_height", "f_player"];
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
.fr { width: 6em; float: left; padding: 2px 5px; text-align: right; }
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

<div class="title">$langaer[27]</div>

<form action="" method="get">
<table border="0" width="100%" style="padding: 0px; margin: 0px">
  <tbody>
  <tr>
    <td style="width: 7em; text-align: right">$langaer[28]</td>
    <td><input type="text" name="url" id="f_url" style="width:100%"
      title="$langaer[29]" />
    </td>
  </tr>
  </tbody>
</table>

<p />

<fieldset style="float: left; margin-left: 5px;">
<legend>$langaer[3]</legend>

<div class="space"></div>

<div class="fl">$langaer[30]</div>
<select size="1" name="auto" id="f_player">
  <option value="wmp" selected="selected" >Windows Media Player</option>
  <option value="real"  >Realone Player</option>
</select>
<p />
<div class="fl">$langaer[3]</div>

<select size="1" name="auto" id="f_auto">
  <option value="0" selected="selected" >$langaer[5]</option>
  <option value="1"  >$langaer[6]</option>
</select>

<p />

</fieldset>

<fieldset style="float:right; margin-right: 5px;">
<legend>$langaer[7]</legend>

<div class="space"></div>

<div class="fr">$langaer[8]</div>
<input type="text" name="width" id="f_width" size="6" value="400"
title="Width" />

<p />

<div class="fr">$langaer[9]</div>
<input type="text" name="height" id="f_height" size="6" value="100"
title="Height" />

<div class="space"></div>

</fieldset>

<div style="margin-top: 85px; text-align: center;">
<button type="button" name="ok" onclick="return onOK();">$langaer[10]</button> 
<button type="button" name="cancel" onclick="return onCancel();">$langaer[11]</button>
</div>


<div style="margin-top: 4px; text-align: right;">
<hr />
This plugin for HTMLArea 3.0 is a product of Bob Shen from bo-blog.com
</div>
</form>

</body>
</html>
eot;
?>