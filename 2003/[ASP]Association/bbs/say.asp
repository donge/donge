<%
name=Request.Cookies("lgname")
pwd=Request.Cookies("lgpwd")
if name="" then
Response.Redirect"login.asp"
response.end
end if
application(name)=1%>
<SCRIPT>
function emoticon(theSmilie){
document.kbbs.body.value +=theSmilie + '';
document.kbbs.body.focus();
}
</SCRIPT><SCRIPT src="ybbcode.js"></SCRIPT>
<SCRIPT>var i=0;
function presskey(eventobject){if(event.ctrlKey && window.event.keyCode==13){i++;if (i>1) {alert('�������ڷ����������ĵȴ���');return false;}this.document.kbbs.submit();}}
</SCRIPT><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="up.asp"--><!--#include file="ubbcode.asp"-->
<%if isnull(pass) or pass="" then
userin=ok
else
user=split(pass,",")
for i = 0 to ubound(user)
if lgname=trim(user(i)) and lgname<>"" then
userin="ok"
exit for
else
userin="no"
end if
next
end if
if userin="no" then
noyes="�� �� ʧ �� ��"
mes="<font color="&c1&"><b>�㲻�ܳɹ��Ľ���ð��棬���ܴ����������⣺</b></font><br>�� �ð���Ϊ��֤��̳���㻹û�еð�������֤��<br> �� �㻹û��<a href=login.asp>��½</a>��<br><br>"%>
<br><!--#include file="mes.asp"-->
<%response.end
else
%><br>
<%pagenum=request.querystring("pagenum")
quoteid=request.querystring("quoteid")
re=request.querystring("re")
if re="no" then
action="save.asp?bd="&bd&"&re=no&pagenum="&pagenum&""
zhuti=""
elseif re="yes" then
id=request.querystring("id")
action="save.asp?bd="&bd&"&id="&id&"&re=yes&pagenum="&pagenum&""
zhuti="�ظ�ID:"&id&""
end if
%>
<form method=POST name=kbbs action=<%=action%>><div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="94%">
    <tr>
<td width="18%" background="pic/5.gif">
<img border="0" src="pic/9.gif" align="absbottom"><font color="#FFFFFF"><b>�� �� �� ��</b></font></td>
<td width="82%" background="pic/7.gif">
<img border="0" src="pic/6.gif"></td></tr></table></div>

<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="<%=c1%>" width="94%">
    <tr>
  <td width="24%" height="30">	<b>&nbsp;�û�����</b></td>
  <td width="76%" height="30"> &nbsp;<input type=text name=name size=20 value="<%=name%>">
  <font color="<%=c1%>">*</font> <a href="zhuce.asp">û��ע�᣿</a></td>    </tr>
    <tr>
      <td width="24%" height="30">&nbsp;<b>��&nbsp; �룺</b></td>
      <td width="76%">&nbsp;<input type=password name=password size=20 value="<%=pwd%>">
      <font color="<%=c1%>">*</font> <a href="getpwd.asp">�������룿</a></td>
    </tr>
    <tr>
      <td width="24%" height="30">&nbsp;<b>�������⣺</b></td>
      <td width="76%">&nbsp;<input type=text name=zhuti size=80 maxlength=59 value="<%=zhuti%>">
  <font color="<%=c1%>">*</font></td>
    </tr>
    <tr>
      <td width="24%" height="50">
      <p style="line-height: 150%; margin-left: 5; margin-top: 5"><b>��ı��飺</b> <br>����������ǰ�档</td>
      <td width="76%"><input type=radio value=face1 name=face checked> 
  <img border=0 src=face/face1.gif width="16" height="16"> <input type=radio value=face2 name=face> 
  <img border=0 src=face/face2.gif width="16" height="16"> <input type=radio value=face3 name=face> 
  <img border=0 src=face/face3.gif width="16" height="16"> <input type=radio value=face4 name=face> 
  <img border=0 src=face/face4.gif width="16" height="16"> <input type=radio value=face5 name=face> 
  <img border=0 src=face/face5.gif width="16" height="16"> <input type=radio value=face6 name=face> 
  <img border=0 src=face/face6.gif width="16" height="16"> <input type=radio value=face7 name=face> 
  <img border=0 src=face/face7.gif width="16" height="16"> <input type=radio value=face8 name=face> 
  <img border=0 src=face/face8.gif width="16" height="16"> <input type=radio value=face9 name=face> 
  <img border=0 src=face/face9.gif width="16" height="16"><p style='margin-top: 2; margin-bottom: 2'>
  <input type=radio value=face10 name=face> 
  <img border=0 src=face/face10.gif width="16" height="16"> <input type=radio value=face11 name=face> 
  <img border=0 src=face/face11.gif width="16" height="16"> <input type=radio value=face12 name=face> 
  <img border=0 src=face/face12.gif width="16" height="16"> <input type=radio value=face13 name=face> 
  <img border=0 src=face/face13.gif width="16" height="16"> <input type=radio value=face14 name=face> 
  <img border=0 src=face/face14.gif width="16" height="16"> <input type=radio value=face15 name=face> 
  <img border=0 src=face/face15.gif width="16" height="16"> <input type=radio value=face16 name=face> 
  <img border=0 src=face/face16.gif width="16" height="16"> <input type=radio value=face17 name=face> 
  <img border=0 src=face/face17.gif width="16" height="16"> <input type=radio value=face18 name=face> 
  <img border=0 src=face/face18.gif width="16" height="16"></td>
    </tr>
<tr>
      <td width="24%" height="296" valign="top">
<p style="line-height: 150%; margin-left: 5; margin-top: 5">
<b>�������ݣ�</b><br>
      ��HTML��ǩ�� ������<br>
��UBB��ǩ�� ����<br>
����ͼ��ǩ�� ����<br>
��Flash��ǩ��������<br>
�������ַ�ת����������<br>
���ϴ�ͼƬ������<br>
�����15KB<br><b>�������ݣ�</b><br>
��<a href="javascript:grade()" title='��ʽ��[showtograde=1]����[/s]			��ʾֻ�еȼ��ڡ�1�����ϲ�����������ݡ�			��1���͡����ݡ������Զ���				ʹ�ø���������'>�ȼ��ɼ�����</a><br>��<a href="javascript:reply()" title='��ʽ��[showtoreply]����[/s]			��ʾֻ�лظ��߲�����������ݡ���		�����ݡ������Զ���				ʹ�ø���������'>�ظ��ɼ�����</a><br>��<a href="javascript:name()" title='��ʽ��[showtoname=zym]����[/s]			��ʾֻ�С�zym��������������ݡ�			��zym���͡����ݡ������Զ���				ʹ�ø���������'>ָ����������</a><br>
<%if re="no" then
%><b>�������ͣ�</b><br>
<input type="radio" name="gonggao" value="0" checked>��ͨ����<br>
<a title="�����ڹ���������ʾ���⣬ʹ�ø�����������Ҫ�۳�����Ǯ1000������200������200��"><input type="radio" name="gonggao" value="4"></a>��������<br><%if admin="yes" then%><input type="radio" name="gonggao" value="1">ϵͳ����<br><%end if%><br><%end if%></td>      <td width="76%" valign="top">
      <p style="margin-left: 4; margin-top: 4">
        <p>
        <IFRAME name=ad 
            src="upload.asp" frameBorder=0 
            width="100%" scrolling=no height=25></IFRAME><br>&nbsp;���ܰ�ť��<IMG onclick=fly() alt=������ src="pic/fly.gif" border=0> 
        <IMG onclick=move() alt=�ƶ��� 
      src="pic/move.gif" border=0> 
        <IMG 
      onclick=light() alt=������ src="pic/glow.gif" border=0> 
        <IMG onclick=ying() alt=��Ӱ�� 
      src="pic/shadow.gif" border=0> 
        <IMG 
      onclick=image() alt=ͼƬ src="pic/image.gif" border=0> 
        <IMG onclick=Cswf() alt=FlashͼƬ 
      src="pic/swf.gif" border=0> 
        <IMG onclick=Cdir() alt=Shockwave�ļ� src="pic/Shockwave.gif" border=0> 
        <IMG onclick=Crm() alt=realplay��Ƶ�ļ� 
      src="pic/rm.gif" border=0> 
        <IMG onclick=Cwmv() alt="Media Player��Ƶ�ļ�" src="pic/mp.gif" border=0><br><br>&nbsp;���ִ�С��<select onchange=ybbsize(this.options[this.selectedIndex].value) name=a style="font-size: 9pt"><OPTION value=1>1</OPTION><OPTION value=2>2</OPTION><OPTION value=3>3</OPTION><OPTION value=4>4</OPTION></SELECT> <span lang=zh-cn>��ɫ��<select onchange=COLOR(this.options[this.selectedIndex].value) name="111" style="font-size: 9pt"><option style='COLOR:000000;BACKGROUND-COLOR:000000' value=000000>��ɫ</option><option style='COLOR:FFFFFF;BACKGROUND-COLOR:FFFFFF' value=FFFFFF>��ɫ</option><option style='COLOR:008000;BACKGROUND-COLOR:008000' value=008000>��ɫ</option><option style='COLOR:800000;BACKGROUND-COLOR:800000' value=800000>��ɫ</option><option style='COLOR:808000;BACKGROUND-COLOR:808000' value=808000>���ɫ</option><option style='COLOR:000080;BACKGROUND-COLOR:000080' value=000080>����ɫ</option><option style='COLOR:800080;BACKGROUND-COLOR:800080' value=800080>��ɫ</option><option style='COLOR:808080;BACKGROUND-COLOR:808080' value=808080>��ɫ</option><option style='COLOR:FFFF00;BACKGROUND-COLOR:FFFF00' value=FFFF00>��ɫ</option><option style='COLOR:00FF00;BACKGROUND-COLOR:00FF00' value=00FF00>ǳ��ɫ</option><option style='COLOR:00FFFF;BACKGROUND-COLOR:00FFFF' value=00FFFF>ǳ��ɫ</option><option style='COLOR:FF00FF;BACKGROUND-COLOR:FF00FF' value=FF00FF>�ۺ�ɫ</option><option style='COLOR:C0C0C0;BACKGROUND-COLOR:C0C0C0' value=C0C0C0>����ɫ</option><option style='COLOR:FF0000;BACKGROUND-COLOR:FF0000' value=FF0000>��ɫ</option><option style='COLOR:0000FF;BACKGROUND-COLOR:0000FF' value=0000FF>��ɫ</option><option style='COLOR:008080;BACKGROUND-COLOR:008080' value=008080>����ɫ</option></select><br><br>
  &nbsp;
<%if quoteid<>"" then
set quote=myconn.execute("select top 1 name,riqi,body from min where bd="&bd&" and id="&quoteid&"")
qqbody=quote("body")
%>
<textarea onkeydown=presskey(); rows=10 name=body cols=79 Title='�� Ctrl+Enter ֱ�ӷ���'>
[quote][color=<%=c1%>]���������� <%=quote("name")%> �� <%=quote("riqi")%> ��������ݣ�[/color]
<%=ubbs(qqbody)%>
[/quote]
</textarea>
<%
set quote=nothing
else%>
<textarea onkeydown=presskey(); rows=10 name=body cols=79 Title='�� Ctrl+Enter ֱ�ӷ���'></textarea><%end if%><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" height="30">
          <tr>
            <td>
            &nbsp;���ͼ�������飺</td>
            <td>
            <A href=javascript:emoticon('{f1)')><IMG alt=Ц�� src=face/xl.gif border=0></A> <A href=javascript:emoticon('{f2)')><IMG alt=����Ц�� src=face/kk.gif border=0></A> <A href=javascript:emoticon('{f3)')><IMG alt=���ȵ�Ц�� src=face/jy.gif border=0></A> <A href=javascript:emoticon('{f4)')><IMG alt=����Ц�� src=face/ts.gif border=0></A> <A href=javascript:emoticon('{f5)')><IMG alt=գ��΢Ц src=face/zy.gif border=0></A> <A href=javascript:emoticon('{f6)')><IMG alt=�ѹ����� src=face/ng.gif border=0></A> <A href=javascript:emoticon('{f7)')><IMG alt=�����Ц�� src=face/kh.gif border=0></A> <A href=javascript:emoticon('{f8)')><IMG alt=ʧ������ src=face/sw.gif border=0></A> <a href=javascript:emoticon('{f9)')><IMG alt=���ε�Ц�� src=face/gg.gif border=0></a>

            </td>
          </tr>
        </table>
<br>
&nbsp;<input type=submit value=OK_���ˣ��������� name=B1>&nbsp; <input type=reset value=NO_���У���Ҫ��д name=B2> [��  Ctrl+Enter ֱ�ӷ���]<br><br>
        
      </td>
    </tr>  </table>
  </center>
</div></form><!--#include file="down.asp"-->
<%end if%>