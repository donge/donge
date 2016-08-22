<!-- #include file="setup.asp" -->
<%

dim alltree
sub TreeList(selec)
sql="Select * From bbsconfig where followid="&selec&" and hide=0 order by SortNum"
Set Rs1=Conn.Execute(sql)
do while not rs1.eof

bbsname=rs1("bbsname")
if Len(""&bbsname&"")>9 then
bbsname=left(""&bbsname&"",7)&"..."
end if

if selec=0 then
alltree=""&alltree&"</DIV><img src=images/bullet.gif><A href=javascript:expands('yuzi"&rs1("id")&"')><font color=215DC6>"&bbsname&"</font></A><BR><DIV class=child id=yuzi"&rs1("id")&"Child style='display:none'>"
else
alltree=""&alltree&"<img src=images/bar.gif> <A href=ShowForum.asp?forumid="&rs1("id")&" target=yuzi_frame onClick=message()>"&bbsname&"</A><br>"
end if

ii=ii+1
if ii <2 then TreeList rs1("id")
ii=ii-1

rs1.movenext
loop
Set Rs1 = Nothing
end sub
TreeList(0)

%>
<SCRIPT>
parent.followTd.innerHTML="<%=alltree%></DIV>";
</SCRIPT>

<%responseend%>