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
<title>会员资料</title>
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
          <TD class=main1 width="624" height="32" bgcolor="#DAE9D1"><font color="#0000FF">会员资料----</font></TD>
        </TR>
        
        </center>
        <%if rs.recordcount=0 then%>
        <tr> 
          <TD class=main1 width=655 bgColor=#F6F6F6 height=39 align="right">
            <p align="left"><font color="#FF0000">错误！</font><font color="#000000">没有查到要查找的会员，可能你输入的会员编号或会员账号错误，也可能是此会员还没有正式在网站上进行注册！</font>
            <p align="center"><input class="main" type="button" size="3" value="返回" name="Submit2" onclick="javascript:window.history.go(-1)"></TD>
        </tr> 
        <%else%>  
        <tr> 
          <TD class=main1 width=655 bgColor=#F6F6F6 height=100 align="right">
            <div align="center">
              <center>
              <table border="1" cellpadding="0" width="100%" cellspacing="0" bordercolorlight="#008000" bordercolordark="#FFFFFF" height="119">
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right"  class=main1 height="23">会员级别：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="23"><%if rs("flag")=0 then%> <%if rs("txtLevel")="普通会员" then%> <input type="radio" value="普通会员" checked name="txtLevel">
                    普通会员 
                    <input type="radio" name="txtLevel" value="vip会员">
                    VIP会员 <%elseif rs("txtLevel")="vip会员" then%> <input type="radio" value="普通会员"  name="txtLevel">
                    普通会员 
                    <input type="radio" name="txtLevel" checked value="vip会员">
                    VIP会员 <%end if%> <%else%> <%=rs("txtLevel")%> <%end if%></td>
                  <td width="19%" bgcolor="#E1F0FF" align="right" class=main1 height="23">会员账号：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="23">　<%=rs("txtId")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">密码：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtPass")%></td>
                  <td width="19%" bgcolor="#E1F0FF" align="right" class=main1 height="24">性别：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtSex")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">自设问题：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtQuestion")%></td>
                  <td width="19%" bgcolor="#E1F0FF" align="right" class=main1 height="24">自设答案：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtAnswer")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">姓名：</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">　<%=rs("txtName")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">所属院系：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtClass")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">寝室号：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtNumber")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">寝室电话：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtTel")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">Oicq：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtOicq")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">电子邮箱：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtEmail")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">省份：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtProv")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">主页：</td>
                  <td width="34%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtPage")%></td>
                  <td width="19%" bgcolor="#DDE8FF" class=main1 height="24" align="right">生日：</td>
                  <td width="29%" bgcolor="#F6F6F6" class=main1 height="24">　<%=rs("txtDate")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">其他联系方式：</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">　<%=rs("txtOther")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">答案1：</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">　<%=rs("txtDesc1")%></td>
                </tr>
                <tr>
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">答案2：</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc2")%></td>
                </tr>
                <tr> 
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">答案3：</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc3")%></td>
                </tr>
                <tr> 
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">答案4：</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc4")%></td>
                </tr>
                <tr> 
                  <td bgcolor="#DDE8FF" align="right" class=main1 height="24">答案5：</td>
                  <td bgcolor="#F6F6F6" colspan="3" class=main1 height="24"><%=rs("txtDesc5")%></td>
                </tr>
                <tr> 
                  <td width="18%" bgcolor="#DDE8FF" align="right" class=main1 height="24">注册日期：</td>
                  <td width="82%" bgcolor="#F6F6F6" colspan="3" class=main1 height="24">　<%=rs("dateandtime")%></td>
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
          <p align="center"><%if rs("flag")=0 then%><input class="main" type="submit" value="验证通过" name="B1"><%end if%><input class="main" type="button" size="3" value="返回" name="Submit2" onclick="javascript:window.history.go(-1)">   
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
     
