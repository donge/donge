<!-- #include file="setup.asp" -->
<%
top
if Request.Cookies("username")=empty then error("<li>����δ<a href=login.asp>��¼</a>����")

%>
<title>��������</title>
<script>
var i=0;
function formCheck(){i++;if (i>1) {document.form.submit1.disabled = true;}return true;}
</script>
<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� ��������</td>
</tr>
</table><br>




<form method="post" action="searchok.asp" name=form>

<center>

<SCRIPT>valigntop()</SCRIPT>
<table height="207" cellSpacing="1" cellPadding="0" width="97%" class=a2 border="0">
<tr>
<td colSpan="2" height=25 class=a1 align="center">������Ҫ�����Ĺؼ���</td>
</tr>
<tr>
<td vAlign="top" bgColor="#FFFFFF" colSpan="2" height="8">
<p align="center"><input size="40" name="content"></td>
</tr>
<tr>
<td class=a1 colSpan="2" height=25 align="center">����ѡ��</td>
</tr>
<tr>
<td width="30%" height="24" bgcolor="FFFFFF">
<p align="right"><font style="FONT-SIZE: 9pt"><label for=search>��������</label></font><input type="radio" value="author" name="search" id=search></td>
<td height=25 bgcolor="FFFFFF">
&nbsp;<select size="1" name="searchxm">
<option selected value="username">������������</option>
<option value="lastname">�������ظ�����</option>
</select></td>
</tr>
<tr>
<td width="30%" height="21" bgcolor="FFFFFF">
<p align="right"><span style="FONT-SIZE: 9pt"><label for=search_1>�ؼ�������</label></span><input type="radio" value="key" name="search" checked id=search_1></td>
<td height=25 bgcolor="FFFFFF">
&nbsp;<select size="1" name="searchxm2">
<option selected value="topic">�������������ؼ���</option>
<%if searchcontent=1 then%>
<option value="content">�������������ؼ���</option>
<%end if%>
</select></td>
</tr>
<tr>
<td width="30%" height="23" bgcolor="FFFFFF">
<p align="right"><font style="FONT-SIZE: 9pt" color="000000">���ڷ�Χ</font></td>
<td height=25 bgcolor="FFFFFF">
&nbsp;<select size="1" name="TimeLimit">
<option value="">��������</option>
<option value="1">��������</option>
<option value="5" selected>5������</option>
<option value="10">10������</option>
<option value="30">30������</option>
</select></td>
</tr>
<tr>
<td width="30%" height="26" align="right" bgcolor="FFFFFF"><font style="FONT-SIZE: 9pt" color="000000">��ѡ��Ҫ��������̳</font></td>
<td height="26" bgcolor="FFFFFF">


&nbsp;<select name="forumid">
<option value="" selected>ȫ����̳</option>
<%BBSList(0)%>

</select> <input type="submit" name=submit1 value="��ʼ����" onclick="return formCheck()"></td>
</tr>

</table>
<SCRIPT>valignbottom()</SCRIPT> &nbsp;</center>







<%


htmlend
%>