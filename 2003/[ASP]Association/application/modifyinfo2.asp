<!--#include file="Conn.asp"-->
<%
userid=trim(Request("userid"))

'�жϽ��ܵ��ʺ��Ƿ����Ҫ��
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ���Ϊ��!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���������!');window.history.go(-1);}</script>"
end if



'�ж��ʺż������Ƿ���ȷ 
 set recCheckUser=server.CreateObject("ADODB.recordset")
 uid=trim(Request("userid"))
 upwd=trim(Request("password"))
 strSQL="select * from userinfo where txtId='" & uid & "' and txtPass='" & upwd & "'"
 recCheckUser.Open  strSQL,conn
 
  if not recCheckUser.EOF then
 	'����û��ʺż�������ȷ
  	
   	'�û�����
 else
 	'�û��ʺż����벻��ȷ
  	recCheckUser.Close 
  	set recCheckUser=nothing
  	set conn=nothing
	Response.Write "<script language=JavaScript>{window.alert('��������ʺż������������������!');window.history.go(-1);}</script>"
	response.end
end if 
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/putong_1t">
<script language="javascript" src="../share/fun_script.js"></script>
<STYLE TYPE="text/css">
<!--
td.grzmRow
{
	padding:0px 4px 0px 4px;	  
}
td.grzmList
{
	padding:0px 4px 0px 0px;	  
}
body
{
	background-color:#F7EBDE;
}
-->
</style>

<title>��������</title>
</HEAD>
<BODY oncontextmenu=self.event.returnValue=false>
<div id="proc" name="proc">		
</div>	             
<form ACTION="modifyinfook.asp" METHOD="POST" NAME="formSignUp">  
<input type=hidden name=txtid value=<%=recCheckUser("txtid")%>>           
<div class="TitleBar">             
��             
</div>             
<div align="center">
  <center>
                 
    <table border=0 cellspacing=1 height=839 width="100%" cellpadding="0">
      <tbody>
        <tr> 
          <td align=right>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">���룺</td>
          <td height=18 width="79%"> <input name=txtPass2 maxLength=10 size=15 value=<%=recCheckUser("txtPass")%>> 
            <font color=#ff0000>* </font><span class=tips_reg style="FONT-SIZE: 9pt">1-10 
            �ַ�,ֻ�������ֺ�Ӣ����ĸ</span>.</td>
        </tr>
        <tr> 
          <td align=right>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">������</td>
          <td height=18 width="79%"> <input name=txtName id="txtName" value="<%=recCheckUser("txtName")%>" size=15 maxLength=50> 
            <font color=#ff0000>*</font></td>
        </tr>
        <tr> 
          <td align=right height=18>�Ա�</td>
          <td height=18> <select name=txtSex size=1>
              <option value="��" selected>��</option>
              <option value="Ů">Ů</option>
            </select> <font color=#ff0000>*</font></td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">�������ڣ�</td>
          <td height=18 width="79%"> <input name=txtDate id="txtDate" value="<%=recCheckUser("txtDate")%>" size=15 maxLength=50> 
            <font color="#FF0000">*</font> 1980/01/01</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">��ͥ���ڵأ�</td>
          <td height=18 width="79%"> <font color=#ff0000> 
            <select name=select size=1>
              <option  value="�㶫">&nbsp;&nbsp;�㶫&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="�ӱ�">&nbsp;&nbsp;�ӱ�&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="������">&nbsp;&nbsp;������&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����" selected>&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="���ɹ�">&nbsp;&nbsp;���ɹ�&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="�ຣ">&nbsp;&nbsp;�ຣ&nbsp;&nbsp;</option>
              <option  value="ɽ��">&nbsp;&nbsp;ɽ��&nbsp;&nbsp;</option>
              <option  value="ɽ��">&nbsp;&nbsp;ɽ��&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="�Ϻ�">&nbsp;&nbsp;�Ϻ�&nbsp;&nbsp;</option>
              <option  value="�Ĵ�">&nbsp;&nbsp;�Ĵ�&nbsp;&nbsp;</option>
              <option  value="���">&nbsp;&nbsp;���&nbsp;&nbsp;</option>
              <option  value="�½�">&nbsp;&nbsp;�½�&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
              <option  value="�㽭">&nbsp;&nbsp;�㽭&nbsp;&nbsp;</option>
              <option  value="����">&nbsp;&nbsp;����&nbsp;&nbsp;</option>
            </select>
            *</font></td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">����Ժϵ��</td>
          <td height=18 width="79%"> <font color=#ff0000> 
            <input name=txtClass id="txtClass" value="<%=recCheckUser("txtClass")%>" size=30 maxlength=50>
            *</font> XXѧԺXXϵXX��</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">���Һţ�</td>
          <td height=18 width="79%"> <input name=txtNumber id="txtNumber" value="<%=recCheckUser("txtNumber")%>" size=30 maxLength=50> 
            <font color=#ff0000>*</font> </td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">���ҵ绰��</td>
          <td height=18 width="79%"> <font color=#ff0000> 
            <input name=txtTel2 value="<%=recCheckUser("txtTel")%>" size=30 maxlength=50>
            </font> <font color=#ff0000>*</font></td>
        </tr>
        <tr> 
          <td align=right width="21%">&nbsp;</td>
          <td width="79%">&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=20 width="21%">Oicq��</td>
          <td height=20 width="79%"> <input name=txtOicq id="txtOicq" value="<%=recCheckUser("txtOicq")%>" size=15 maxLength=20> 
          </td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">Email��</td>
          <td height=18 width="79%"> <input name=txtEmail2 id="txtEmail" value="<%=recCheckUser("txtEmail")%>" size=15 maxLength=30> 
          </td>
        </tr>
        <tr> 
          <td align=right height=18>������ҳ��</td>
          <td height=18> <font color=#ff0000> 
            <input name=txtPage id="txtPage" value="<%=recCheckUser("txtPage")%>" size=30 maxlength=50>
            </font></td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">������ϵ��ʽ��</td>
          <td height=18 width="79%"> <input name=txtOther id="txtOther" value="<%=recCheckUser("txtOther")%>" size=50 maxLength=50> 
          </td>
        </tr>
        <tr> 
          <td align=right>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">�Ƿ��и��˵��Բ��򵥽��ܶԵ��Ե��˽�</td>
          <td height=18 width="79%"> <textarea name=txtDesc1 cols=48 rows=3 id="txtDesc1"><%=recCheckUser("txtdesc1")%></textarea> 
            <font color="#FF0000">*</font> </td>
        </tr>
        <tr> 
          <td align=right height=18>�����������ķ�ʽ��ÿ��������ʱ��</td>
          <td height=18> <textarea name=txtDesc2 cols=48 rows=3 id="txtDesc2"><%=recCheckUser("txtdesc2")%></textarea> 
            <font color="#FF0000">*</font> </td>
        </tr>
        <tr> 
          <td align=right height=18≯̸��ϲ���ĵ�����Ϸ</td>
          <td height=18><textarea name=txtDesc3 cols=48 rows=3 id="txtDesc3"><%=recCheckUser("txtdesc3")%></textarea> 
            <font color="#FF0000">*</font></td>
        </tr>
        <tr> 
          <td align=right height=18>�򵥽�����ϣ�����뱾Э�����ҪĿ��</td>
          <td height=18><textarea name=txtDesc4 cols=48 rows=3 id="txtDesc4"><%=recCheckUser("txtdesc4")%></textarea> 
            <font color="#FF0000">*</font></td>
        </tr>
        <tr> 
          <td align=right height=18>˵����ϣ����Э��ٰ�Ļ</td>
          <td height=18><textarea name=txtDesc5 cols=48 rows=3 id="txtDesc5"><%=recCheckUser("txtdesc5")%></textarea> 
            <font color="#FF0000">*</font></td>
        </tr>
        <tr> 
          <td align=right></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%"></td>
          <td height=18   width="79%"> <input name="cmdOK" type="submit" id="cmdOK" value=�޸�����> 
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <input name="cmdReset2" type="reset" value=��������> 
          </td>
        </tr>
      </tbody>
    </table>
  </div>               
</form>                   
</BODY>                   
