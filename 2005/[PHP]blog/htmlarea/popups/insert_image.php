<?
@header("Content-Type: text/html; charset=utf-8");
require ("poplang.php");
echo<<<eot
<html style="width: 398; height: 280">

<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>$langaer[12]</title>

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
  var fields = ["f_url", "f_alt", "f_align", "f_border",
                "f_horiz", "f_vert"];
  var param = new Object();
  for (var i in fields) {
    var id = fields[i];
    var el = document.getElementById(id);
    param[id] = el.value;
  }
  if (preview_window) {
    preview_window.close();
  }
  __dlg_close(param);
  return false;
};

function onCancel() {
  if (preview_window) {
    preview_window.close();
  }
  __dlg_close(null);
  return false;
};

function onPreview() {
  var f_url = document.getElementById("f_url");
  var url = f_url.value;
  if (!url) {
    alert("You have to enter an URL first");
    f_url.focus();
    return false;
  }
  var img = new Image();
  img.src = url;
  var win = null;
  if (!document.all) {
    win = window.open("about:blank", "ha_imgpreview", "toolbar=no,menubar=no,personalbar=no,innerWidth=100,innerHeight=100,scrollbars=no,resizable=yes");
  } else {
    win = window.open("about:blank", "ha_imgpreview", "channelmode=no,directories=no,height=100,width=100,location=no,menubar=no,resizable=yes,scrollbars=no,toolbar=no");
  }
  preview_window = win;
  var doc = win.document;
  var body = doc.body;
  if (body) {
    body.innerHTML = "";
    body.style.padding = "0px";
    body.style.margin = "0px";
    var el = doc.createElement("img");
    el.src = url;

    var table = doc.createElement("table");
    body.appendChild(table);
    table.style.width = "100%";
    table.style.height = "100%";
    var tbody = doc.createElement("tbody");
    table.appendChild(tbody);
    var tr = doc.createElement("tr");
    tbody.appendChild(tr);
    var td = doc.createElement("td");
    tr.appendChild(td);
    td.style.textAlign = "center";

    td.appendChild(el);
    win.resizeTo(el.offsetWidth + 30, el.offsetHeight + 30);
  }
  win.focus();
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

<div class="title">$langaer[12]</div>

<form action="" method="get">
<table border="0" width="100%" style="padding: 0px; margin: 0px">
  <tbody>

  <tr>
    <td style="width: 7em; text-align: right">$langaer[13]</td>
    <td><input type="text" name="url" id="f_url" style="width:75%"
      title="$langaer[14]" />
      <button name="preview" onclick="return onPreview();"
      title="$langaer[15]">$langaer[16]</button>
    </td>
  </tr>
  <tr>
    <td style="width: 7em; text-align: right">$langaer[17]</td>
    <td><input type="text" name="alt" id="f_alt" style="width:100%"
      title="$langaer[18]" /></td>
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
  <option value=""       selected="1"                      >$langaer[21]</option>
  <option value="left"                         >left</option>
  <option value="right"                        >right</option>
  <option value="texttop"                      >texttop</option>
  <option value="absmiddle"                    >absmiddle</option>
  <option value="baseline"         >baseline</option>
  <option value="absbottom"                    >absbottom</option>
  <option value="bottom"                       >bottom</option>
  <option value="middle"                       >middle</option>
  <option value="top"                          >top</option>
</select>

<p />

<div class="fl">$langaer[22]</div>
<input type="text" name="border" id="f_border" size="5"
title="$langaer[23]" />

<div class="space"></div>

</fieldset>

<fieldset style="float:right; margin-right: 5px;">
<legend>$langaer[24]</legend>

<div class="space"></div>

<div class="fr">$langaer[25]</div>
<input type="text" name="horiz" id="f_horiz" size="5"
title="Horizontal padding" />

<p />

<div class="fr">$langaer[26]</div>
<input type="text" name="vert" id="f_vert" size="5"
title="Vertical padding" />

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