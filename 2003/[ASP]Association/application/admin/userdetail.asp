<%@ LANGUAGE="VBSCRIPT" %>
<%
if request.cookies("adminok")="" then
  response.redirect "login.htm"
end if
%>
<!--#include file="../admin/conn.asp"-->
<%
id=request("id")

set rs=server.createobject("adodb.recordset")
sqltext="select * from userinfo where id="&id&""
rs.open sqltext,conn,1,1
%>
<html>
<head>
<title>��Ա����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../admin/style.css" type="text/css">
</head>
<body  text="#000000">
      <div align="center">
        <p>
        <center>
           <br> 
        </p>
        <FORM ACTION="../admin/userbeginok.asp" METHOD="POST" NAME="formSignUp">
        <input type=hidden name=id value=<%=rs("id")%>>
        
    <TABLE cellSpacing=1 cellPadding=4 width=519 bgColor=#416327 height="256">
      <TBODY>
        <TR vAlign=top bgColor=#e1f0ff> 
          <TD class=main1 width="624" height="10" bgcolor="#006500"></TD>
        </TR>
        <TR vAlign=top bgColor=#e1f0ff> 
          <TD class=main1 width="624" height="32" bgcolor="#DAE9D1"><font color="#0000FF">��Ա����----</font></TD>
        </TR>
        
        </center>
        <%if rs.recordcount=0 then%>
        <tr> 
          <TD class=main1 width=655 bgColor=#F6F6F6 height=39 align="right">
            <p align="left"><font color="#FF0000">����</font><font color="#000000">û�в鵽Ҫ���ҵĻ�Ա������������Ļ�Ա��Ż��Ա�˺Ŵ���Ҳ�����Ǵ˻�Ա��û����ʽ����վ�Ͻ���ע�ᣡ</font>
            <p align="center"><input class="main" type="button" size="3" value="����" name="Submit2" onclick="javascript:window.history.go(-1)"></TD>
        </tr> 
        <%else%>  
        <tr> 
          <TD class=main1 width=655 bgColor=#F6F6F6 height=100 align="right">
            <div align="center">
              <center>
              <table border="1" cellpadding="0" width="100%" cellspacing="0" bordercolorlight="#008000" bordercolordark="#FFFFFF" height="119">
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right"  class=main1 height="23">��Ա����</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="23"><%if rs("flag")=0 then%> <%if rs("txtLevel")="��ͨ��Ա" then%> <input type="radio" value="��ͨ��Ա" checked name="txtLevel">
                    ��ͨ��Ա 
                    <input type="radio" name="txtLevel" value="vip��Ա">
                    VIP��Ա <%elseif rs("txtLevel")="vip��Ա" then%> <input type="radio" value="��ͨ��Ա"  name="txtLevel">
                    ��ͨ��Ա 
                    <input type="radio" name="txtLevel" checked value="vip��Ա">
                    VIP��Ա <%end if%> <%else%> <%=rs("txtLevel")%> <%end if%></td>
                  <td width="19%" bgcolor="#E1F0FF" align="right" class=main1 height="23">��Ա�˺ţ�</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="23">��<%=rs("txtId")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">���룺</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtPass")%></td>
                  <td width="19%" bgcolor="#E1F0FF" align="right" class=main1 height="24">�Ա�</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtSex")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">�������⣺</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtQuestion")%></td>
                  <td width="19%" bgcolor="#E1F0FF" align="right" class=main1 height="24">����𰸣�</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtAnswer")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">������</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">��<%=rs("txtName")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">����Ժϵ��</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtClass")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">���Һţ�</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtNumber")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">���ҵ绰��</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtTel")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">Oicq��</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtOicq")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">�������䣺</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtEmail")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">ʡ�ݣ�</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtProv")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">��ҳ��</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtPage")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">���գ�</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">��<%=rs("txtDate")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">������ϵ��ʽ��</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">��<%=rs("txtOther")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">��1��</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">��<%=rs("txtDesc1")%></td>
                </tr>
                <tr>
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">��2��</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc2")%></td>
                </tr>
                <tr> 
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">��3��</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc3")%></td>
                </tr>
                <tr> 
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">��4��</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc4")%></td>
                </tr>
                <tr> 
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">��5��</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc5")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">ע�����ڣ�</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">��<%=rs("dateandtime")%></td>
                </tr></center><center>
              </table>
              </center>
            </div>
          </TD>
        </tr>   
        <center>
        
      <center>
        <tr> 

      </center>
        </center>
        <center>     
             
      <center>     
      </center>  
        <center>  
          
      <center>  
      </center>  
        <center>  
          
      <center>  
      </center>  
      <center>  
      </center><center>    
      <TR bgColor=#e1f0ff>     
        <TD class=main1 width="624" height="49" bgcolor="#DAE9D1">   
          <p align="center"><%if rs("flag")=0 then%><input class="main" type="submit" value="��֤ͨ��" name="B1"><%end if%><input class="main" type="button" size="3" value="����" name="Submit2" onclick="javascript:window.history.go(-1)">   
        </TD>     
      </TR>     
      <TR bgColor=#e1f0ff>      
        <TD class=main1 width="624" height="4" bgcolor="#398A00"></TD>     
      </TR>
      
      <%end if%></TBODY>     
    </TABLE>    
    </form>    
  </div>        
      <p align="center">     
    
</center>     
     
    </center>     
     
</body>     
</html>     
     
