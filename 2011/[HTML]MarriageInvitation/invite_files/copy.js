function copyToClipboard(txt) {
  //var txt=strurl;
  //alert(strurl);
  if (window.clipboardData) {
    window.clipboardData.clearData();
    window.clipboardData.setData("Text", txt);
  } else if (navigator.userAgent.indexOf("Opera") != -1) {
    window.location = txt;
  } else if (window.netscape) {
    try {
      netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
    } catch (e) {
      alert("此操作被浏览器拒绝！ 请在浏览器地址栏输入'about:config'并回车 然后将[signed.applets.codebase_principal_support]设置为'true'");
    }
    var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
    if (!clip) {
      return;
    }
    var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
    if (!trans) {
      return;
    }
    trans.addDataFlavor('text/unicode');
    var str = new Object();
    var len = new Object();
    var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
    var copytext = txt;
    str.data = copytext;
    trans.setTransferData("text/unicode", str, copytext.length*2);
    var clipid = Components.interfaces.nsIClipboard;
    if (!clip) {
      return false;
    }
    clip.setData(trans, null, clipid.kGlobalClipboard);
    //alert("复制成功");
  }
  alert("地址复制成功，请粘贴给你好友的QQ或MSN");
}