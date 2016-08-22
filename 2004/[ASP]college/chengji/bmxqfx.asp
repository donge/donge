<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%  



  if Session.Contents("gws")=true or Session.Contents("gws1")=true then
  
jlh=request("jlh")
s= request("s")
mc=request("mc")

if s="" then	
		response.write"<script language='javascript'>" 
		 response.write"alert('低短嗤補秘何壇兆各��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

  dim rs,rs1,rs2
 dim sql,sql1,sql2,mzxs
  set rs=server.createobject("adodb.recordset")
  set rs1=server.createobject("adodb.recordset")
  
  
  
 sql1="select * from zybjmc where s='" + s + "'"

 rs1.open sql1,conn,3,3

  
if jlh="" then jlh=0
if mc="" then mc=1

if mc="1" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs10+fs11+fs12+fs13+fs14+fs15+fs16+fs17+fs18+fs19+fs110+fs111+fs112+fs113+fs114+fs115+fs116+fs117+fs118+fs119 desc"
  rs.open sql,conn,3,3 
elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs10 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs10")
  mzxs1="fs10"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs11 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs11")
  mzxs1="fs11"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs12 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs12")
  mzxs1="fs12"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs13 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs13")
  mzxs1="fs13"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs14 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs14")
  mzxs1="fs14"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs15 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs15")
  mzxs1="fs15"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs16 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs16")
  mzxs1="fs16"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs17 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs17")
  mzxs1="fs17"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs18 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs18")
  mzxs1="fs18"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs19 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs19")
  mzxs1="fs19"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs110 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs110")
  mzxs1="fs110"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs111 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs111")
  mzxs1="fs111"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs112 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs112")
  mzxs1="fs112"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs113 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs113")
  mzxs1="fs113"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs114 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs114")
  mzxs1="fs114"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs115 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs115")
  mzxs1="fs115"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs116 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs116")
  mzxs1="fs116"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs117 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs117")
  mzxs1="fs117"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs118 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs118")
  mzxs1="fs118"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs119 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs119")
  mzxs1="fs119"


end if 
end if
if mc="2" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs20+fs21+fs22+fs23+fs24+fs25+fs26+fs27+fs28+fs29+fs120+fs121+fs122+fs123+fs124+fs125+fs126+fs127+fs128+fs129 desc"
  rs.open sql,conn,3,3  

elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs20 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs20")
   mzxs1="fs20"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs21 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs21")
   mzxs1="fs21"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs22 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs22")
   mzxs1="fs22"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs23 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs23")
   mzxs1="fs23"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs24 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs24")
   mzxs1="fs24"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs25 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs25")
   mzxs1="fs25"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs26 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs26")
   mzxs1="fs26"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs27 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs27")
   mzxs1="fs27"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs28 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs28")
   mzxs1="fs28"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs29 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs29")
   mzxs1="fs29"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs120 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs120")
   mzxs1="fs120"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs121 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs121")
   mzxs1="fs121"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs122 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs122")
   mzxs1="fs122"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs123 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs123")
   mzxs1="fs123"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs124 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs124")
   mzxs1="fs124"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs125 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs125")
   mzxs1="fs125"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs126 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs126")
   mzxs1="fs126"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs127 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs127")
   mzxs1="fs127"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs128 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs128")
   mzxs1="fs128"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs129 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs129")
   mzxs1="fs129"

end if 
end if
if mc="3" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs30+fs31+fs32+fs33+fs34+fs35+fs36+fs37+fs38+fs39+fs130+fs131+fs132+fs133+fs134+fs135+fs136+fs137+fs138+fs139 desc"
  rs.open sql,conn,3,3  

elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs30 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs30")
    mzxs1="fs30"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs31 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs31")
    mzxs1="fs31"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs32 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs32")
    mzxs1="fs32"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs33 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs33")
    mzxs1="fs33"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs34 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs34")
    mzxs1="fs34"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs35 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs35")
    mzxs1="fs35"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs36 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs36")
    mzxs1="fs36"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs37 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs37")
    mzxs1="fs37"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs38 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs38")
    mzxs1="fs38"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs39 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs39")
    mzxs1="fs39"


elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs130 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs130")
    mzxs1="fs130"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs131 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs131")
    mzxs1="fs131"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs132 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs132")
    mzxs1="fs132"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs133 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs133")
    mzxs1="fs133"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs134 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs134")
    mzxs1="fs134"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs135 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs135")
    mzxs1="fs135"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs136 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs136")
    mzxs1="fs136"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs137 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs137")
    mzxs1="fs137"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs138 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs138")
    mzxs1="fs138"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs139 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs139")
    mzxs1="fs139"


end if 

end if
if mc="4" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs40+fs41+fs42+fs43+fs44+fs45+fs46+fs47+fs48+fs49+fs140+fs141+fs142+fs143+fs144+fs145+fs146+fs147+fs148+fs149 desc"
  rs.open sql,conn,3,3  

elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs40 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs40")
     mzxs1="fs40"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs41 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs41")
     mzxs1="fs41"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs42 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs42")
     mzxs1="fs42"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs43 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs43")
     mzxs1="fs43"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs44 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs44")
     mzxs1="fs44"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs45 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs45")
     mzxs1="fs45"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs46 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs46")
     mzxs1="fs46"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs47 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs47")
     mzxs1="fs47"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs48 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs48")
     mzxs1="fs48"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs49 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs49")
     mzxs1="fs49"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs140 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs140")
     mzxs1="fs140"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs141 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs141")
     mzxs1="fs141"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs142 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs142")
     mzxs1="fs142"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs143 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs143")
     mzxs1="fs143"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs144 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs144")
     mzxs1="fs144"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs145 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs145")
     mzxs1="fs145"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs146 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs146")
     mzxs1="fs146"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs147 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs147")
     mzxs1="fs147"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs148 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs148")
     mzxs1="fs148"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs149 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs149")
     mzxs1="fs149"


end if 


end if
if mc="5" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs50+fs51+fs52+fs53+fs54+fs55+fs56+fs57+fs58+fs59+fs150+fs151+fs152+fs153+fs154+fs155+fs156+fs157+fs158+fs159 desc"
  rs.open sql,conn,3,3 
 
elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs50 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs50")
    mzxs1="fs50"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs51 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs51")
  mzxs1="fs51"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs52 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs52")
  mzxs1="fs52"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs53 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs53")
  mzxs1="fs53"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs54 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs54")
  mzxs1="fs54"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs55 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs55")
  mzxs1="fs55"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs56 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs56")
  mzxs1="fs56"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs57 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs57")
  mzxs1="fs57"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs58 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs58")
  mzxs1="fs58"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs59 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs59")
  mzxs1="fs59"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs150 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs150")
    mzxs1="fs150"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs151 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs151")
  mzxs1="fs151"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs152 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs152")
  mzxs1="fs152"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs153 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs153")
  mzxs1="fs153"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs154 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs154")
  mzxs1="fs154"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs155 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs155")
  mzxs1="fs155"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs156 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs156")
  mzxs1="fs156"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs157 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs157")
  mzxs1="fs157"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs158 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs158")
  mzxs1="fs158"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs159 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs159")
  mzxs1="fs159"


end if 



end if
if mc="6" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs60+fs61+fs62+fs63+fs64+fs65+fs66+fs67+fs68+fs69+fs160+fs161+fs162+fs163+fs164+fs165+fs166+fs167+fs168+fs169 desc"
  rs.open sql,conn,3,3 
 
elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs60 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs60")
   mzxs1="fs60"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs61 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs61")
   mzxs1="fs61"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs62 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs62")
   mzxs1="fs62"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs63 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs63")
   mzxs1="fs63"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs64 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs64")
   mzxs1="fs64"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs65 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs65")
   mzxs1="fs65"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs66 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs66")
   mzxs1="fs66"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs67 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs67")
   mzxs1="fs67"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs68 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs68")
   mzxs1="fs68"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs69 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs69")
   mzxs1="fs69"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs160 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs160")
   mzxs1="fs160"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs161 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs161")
   mzxs1="fs161"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs162 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs162")
   mzxs1="fs162"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs163 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs163")
   mzxs1="fs163"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs164 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs164")
   mzxs1="fs164"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs165 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs165")
   mzxs1="fs165"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs166 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs166")
   mzxs1="fs166"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs167 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs167")
   mzxs1="fs167"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs168 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs168")
   mzxs1="fs168"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs169 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs169")
   mzxs1="fs169"



end if 


end if
if mc="7" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs70+fs71+fs72+fs73+fs74+fs75+fs76+fs77+fs78+fs79+fs170+fs171+fs172+fs173+fs174+fs175+fs176+fs177+fs178+fs179 desc"
  rs.open sql,conn,3,3  

elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs70 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs70")
    mzxs1="fs70"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs71 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs71")
    mzxs1="fs71"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs72 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs72")
    mzxs1="fs72"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs73 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs73")
    mzxs1="fs73"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs74 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs74")
    mzxs1="fs74"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs75 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs75")
    mzxs1="fs75"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs76 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs76")
    mzxs1="fs76"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs77 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs77")
    mzxs1="fs77"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs78 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs78")
    mzxs1="fs78"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs79 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs79")
    mzxs1="fs79"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs170 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs170")
    mzxs1="fs170"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs171 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs171")
    mzxs1="fs171"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs172 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs172")
    mzxs1="fs172"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs173 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs173")
    mzxs1="fs173"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs174 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs174")
    mzxs1="fs174"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs175 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs175")
    mzxs1="fs175"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs176 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs176")
    mzxs1="fs176"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs177 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs177")
    mzxs1="fs177"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs178 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs178")
    mzxs1="fs178"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs179 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs179")
    mzxs1="fs179"



end if 


end if
if mc="8" then
 if jlh=0 then
 sql="select * from cxb where s like '%"&s&"%' Order by fs80+fs81+fs82+fs83+fs84+fs85+fs86+fs87+fs88+fs89+fs180+fs181+fs182+fs183+fs184+fs185+fs186+fs187+fs188+fs189 desc"
  rs.open sql,conn,3,3  

elseif jlh=1 then
sql="select * from cxb where s like '%"&s&"%' Order by fs80 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs80")
    mzxs1="fs80"

elseif jlh=2 then
sql="select * from cxb where s like '%"&s&"%' Order by fs81 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs81")
    mzxs1="fs81"

elseif jlh=3 then
sql="select * from cxb where s like '%"&s&"%' Order by fs82 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs82")
    mzxs1="fs82"

elseif jlh=4 then
sql="select * from cxb where s like '%"&s&"%' Order by fs83 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs83")
    mzxs1="fs83"

elseif jlh=5 then
sql="select * from cxb where s like '%"&s&"%' Order by fs84 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs84")
    mzxs1="fs84"

elseif jlh=6 then
sql="select * from cxb where s like '%"&s&"%' Order by fs85 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs85")
    mzxs1="fs85"

elseif jlh=7 then
sql="select * from cxb where s like '%"&s&"%' Order by fs86 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs86")
    mzxs1="fs86"

elseif jlh=8 then
sql="select * from cxb where s like '%"&s&"%' Order by fs87 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs87")
    mzxs1="fs87"

elseif jlh=9 then
sql="select * from cxb where s like '%"&s&"%' Order by fs88 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs88")
    mzxs1="fs88"

elseif jlh=10 then
sql="select * from cxb where s like '%"&s&"%' Order by fs89 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs89")
    mzxs1="fs89"

elseif jlh=11 then
sql="select * from cxb where s like '%"&s&"%' Order by fs180 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs180")
    mzxs1="fs180"

elseif jlh=12 then
sql="select * from cxb where s like '%"&s&"%' Order by fs181 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs181")
    mzxs1="fs181"

elseif jlh=13 then
sql="select * from cxb where s like '%"&s&"%' Order by fs182 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs182")
    mzxs1="fs182"

elseif jlh=14 then
sql="select * from cxb where s like '%"&s&"%' Order by fs183 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs183")
    mzxs1="fs183"

elseif jlh=15 then
sql="select * from cxb where s like '%"&s&"%' Order by fs184 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs184")
    mzxs1="fs184"

elseif jlh=16 then
sql="select * from cxb where s like '%"&s&"%' Order by fs185 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs185")
    mzxs1="fs185"

elseif jlh=17 then
sql="select * from cxb where s like '%"&s&"%' Order by fs186 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs186")
    mzxs1="fs186"

elseif jlh=18 then
sql="select * from cxb where s like '%"&s&"%' Order by fs187 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs187")
    mzxs1="fs187"

elseif jlh=19 then
sql="select * from cxb where s like '%"&s&"%' Order by fs188 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs188")
    mzxs1="fs188"

elseif jlh=20 then
sql="select * from cxb where s like '%"&s&"%' Order by fs189 desc"
 rs.open sql,conn,3,3
 mzxs=rs1("fs189")
    mzxs1="fs189"


end if 


end if

 
 






if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('短嗤憲栽艇勣箔議芝村��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs.recordcount
if not isnumeric(request("page")) or isempty(request("page")) then
page=1
else
page=int(abs(request("page")))
end if
rs.pagesize=10
mypagesize=rs.pagesize
if total<>0 then
rs.absolutepage=page
end if

Dim js,zf
js=0
zf=0







%>
<html>
<head>
<title>親室何</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">







<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="鯖猟佩尻" size="6">
            <%=zybj%></font></font></b></div>      

          <div align="center"><b><font face="鯖猟佩尻" size="6" color=red>
<%=s%></font><br><font color=red>及<font color=black size="4">*<%=mc%>*</font>僥豚<br>
<%
if mzxs="" then
%>
<font color=green size="4">悳蛍蛍裂</font>
<%
else
%>
<font color=green size="4"><a href='mfbm.asp?s=<%=s%>&mzxs1=<%=mzxs1%>&mzxs=<%=mzxs%>&mc=<%=mc%>' target='_blank'><%=mzxs%>撹示蛍裂</a></font>
<%
end if
%>
</font></b></div>      
<br>

        <div align="center"><b><font color="#0066FF">慌嗤<font color=red><%=total%></font>了僥伏 
        </font></b></div>
    </td>
  </tr>
</table>

    <center>
	<table border=1 cellpadding=1 cellspacing=1>
	<tr bgcolor=silver style='color:black'>
    <td align=center>兆肝</td>
    <td align=center>萎雫</td>
    <td align=center>僥催</td>
    <td align=center>侖兆</td>
    <td align=center>來艶</td> 
 <%
 if mc="1" then
 %>
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=1&s=<%=s%>'><%=rs1("fs10")%></a>　</td>
    <%
    
    if rs1("fs10")<>"" then
    js=js+1
    end if
    %>
    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=1&s=<%=s%>'><%=rs1("fs11")%></a>　</td>
     <%
    if rs1("fs11")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=1&s=<%=s%>'><%=rs1("fs12")%></a>　</td>
     <%
    if rs1("fs12")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=1&s=<%=s%>'><%=rs1("fs13")%></a>　</td>
     <%
    if rs1("fs13")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=1&s=<%=s%>'><%=rs1("fs14")%></a>　</td>
     <%
    if rs1("fs14")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=1&s=<%=s%>'><%=rs1("fs15")%></a>　</td>
     <%
    if rs1("fs15")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=1&s=<%=s%>'><%=rs1("fs16")%></a>　</td>
     <%
    if rs1("fs16")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=1&s=<%=s%>'><%=rs1("fs17")%></a>　</td>
     <%
    if rs1("fs17")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=1&s=<%=s%>'><%=rs1("fs18")%></a>　</td>
     <%
    if rs1("fs18")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=1&s=<%=s%>'><%=rs1("fs19")%></a>　</td>
    
     <%
    if rs1("fs19")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=11&mc=1&s=<%=s%>'><%=rs1("fs110")%></a>　</td>
    <%
    
    if rs1("fs110")<>"" then
    js=js+1
    end if
    %>
    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=1&s=<%=s%>'><%=rs1("fs111")%></a>　</td>
     <%
    if rs1("fs111")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=1&s=<%=s%>'><%=rs1("fs112")%></a>　</td>
     <%
    if rs1("fs112")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=1&s=<%=s%>'><%=rs1("fs113")%></a>　</td>
     <%
    if rs1("fs113")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=1&s=<%=s%>'><%=rs1("fs114")%></a>　</td>
     <%
    if rs1("fs114")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=1&s=<%=s%>'><%=rs1("fs115")%></a>　</td>
     <%
    if rs1("fs115")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=1&s=<%=s%>'><%=rs1("fs116")%></a>　</td>
     <%
    if rs1("fs116")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=1&s=<%=s%>'><%=rs1("fs117")%></a>　</td>
     <%
    if rs1("fs117")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=1&s=<%=s%>'><%=rs1("fs118")%></a>　</td>
     <%
    if rs1("fs118")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=1&s=<%=s%>'><%=rs1("fs119")%></a>　</td>
    
     <%
    if rs1("fs119")<>"" then
    js=js+1
    end if
    %>
   
    
    
    
<%
end if
%>

 <%
 if mc="2" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=2&s=<%=s%>'><%=rs1("fs20")%></a>　</td> 
    <%
    if rs1("fs20")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=2&s=<%=s%>'><%=rs1("fs21")%></a>　</td>
       <%
    if rs1("fs21")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=2&s=<%=s%>'><%=rs1("fs22")%></a>　</td>
       <%
    if rs1("fs22")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=2&s=<%=s%>'><%=rs1("fs23")%></a>　</td>
       <%
    if rs1("fs23")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=2&s=<%=s%>'><%=rs1("fs24")%>　</a></td>
       <%
    if rs1("fs24")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=2&s=<%=s%>'><%=rs1("fs25")%>　</a></td>
       <%
    if rs1("fs25")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=2&s=<%=s%>'><%=rs1("fs26")%></a>　</td>
       <%
    if rs1("fs26")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=2&s=<%=s%>'><%=rs1("fs27")%></a>　</td>
       <%
    if rs1("fs27")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=2&s=<%=s%>'><%=rs1("fs28")%>　</a></td>
       <%
    if rs1("fs28")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=2&s=<%=s%>'><%=rs1("fs29")%>　</a></td>
       <%
    if rs1("fs29")<>"" then
    js=js+1
    end if
    %>

 <td align=center><a  href='bmxqfx.asp?jlh=11&mc=2&s=<%=s%>'><%=rs1("fs120")%></a>　</td> 
    <%
    if rs1("fs120")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=2&s=<%=s%>'><%=rs1("fs121")%></a>　</td>
       <%
    if rs1("fs121")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=2&s=<%=s%>'><%=rs1("fs122")%></a>　</td>
       <%
    if rs1("fs122")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=2&s=<%=s%>'><%=rs1("fs123")%></a>　</td>
       <%
    if rs1("fs123")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=2&s=<%=s%>'><%=rs1("fs124")%>　</a></td>
       <%
    if rs1("fs124")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=2&s=<%=s%>'><%=rs1("fs125")%>　</a></td>
       <%
    if rs1("fs125")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=2&s=<%=s%>'><%=rs1("fs126")%></a>　</td>
       <%
    if rs1("fs126")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=2&s=<%=s%>'><%=rs1("fs127")%></a>　</td>
       <%
    if rs1("fs127")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=2&s=<%=s%>'><%=rs1("fs128")%>　</a></td>
       <%
    if rs1("fs128")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=2&s=<%=s%>'><%=rs1("fs129")%>　</a></td>
       <%
    if rs1("fs129")<>"" then
    js=js+1
    end if
    %>



<%
end if
%>

 <%
 if mc="3" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=3&s=<%=s%>'><%=rs1("fs30")%></a>　</td>
       <%
    if rs1("fs30")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=3&s=<%=s%>'><%=rs1("fs31")%>　</a></td>
       <%
    if rs1("fs31")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=3&s=<%=s%>'><%=rs1("fs32")%>　</a></td>
       <%
    if rs1("fs32")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=3&s=<%=s%>'><%=rs1("fs33")%>　</a></td>
       <%
    if rs1("fs33")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=3&s=<%=s%>'><%=rs1("fs34")%>　</a></td>
       <%
    if rs1("fs34")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=3&s=<%=s%>'><%=rs1("fs35")%>　</a></td>
       <%
    if rs1("fs35")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=3&s=<%=s%>'><%=rs1("fs36")%>　</a></td>
       <%
    if rs1("fs36")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=3&s=<%=s%>'><%=rs1("fs37")%>　</a></td>
       <%
    if rs1("fs37")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=3&s=<%=s%>'><%=rs1("fs38")%>　</a></td>
       <%
    if rs1("fs38")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=3&s=<%=s%>'><%=rs1("fs39")%>　</a></td>
       <%
    if rs1("fs39")<>"" then
    js=js+1
    end if
    %>

   <td align=center><a  href='bmxqfx.asp?jlh=11&mc=3&s=<%=s%>'><%=rs1("fs130")%></a>　</td>
       <%
    if rs1("fs130")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=3&s=<%=s%>'><%=rs1("fs131")%>　</a></td>
       <%
    if rs1("fs131")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=3&s=<%=s%>'><%=rs1("fs132")%>　</a></td>
       <%
    if rs1("fs132")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=3&s=<%=s%>'><%=rs1("fs133")%>　</a></td>
       <%
    if rs1("fs133")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=3&s=<%=s%>'><%=rs1("fs134")%>　</a></td>
       <%
    if rs1("fs134")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=3&s=<%=s%>'><%=rs1("fs135")%>　</a></td>
       <%
    if rs1("fs135")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=3&s=<%=s%>'><%=rs1("fs136")%>　</a></td>
       <%
    if rs1("fs136")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=3&s=<%=s%>'><%=rs1("fs137")%>　</a></td>
       <%
    if rs1("fs137")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=3&s=<%=s%>'><%=rs1("fs138")%>　</a></td>
       <%
    if rs1("fs138")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=3&s=<%=s%>'><%=rs1("fs139")%>　</a></td>
       <%
    if rs1("fs139")<>"" then
    js=js+1
    end if
    %>



<%
end if
%>


 <%
 if mc="4" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=4&s=<%=s%>'><%=rs1("fs40")%>　</a></td>
       <%
    if rs1("fs40")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=4&s=<%=s%>'><%=rs1("fs41")%>　</a></td>
        <%
    if rs1("fs41")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=4&s=<%=s%>'><%=rs1("fs42")%>　</a></td>
         <%
    if rs1("fs42")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=4&s=<%=s%>'><%=rs1("fs43")%>　</a></td>
         <%
    if rs1("fs43")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=4&s=<%=s%>'><%=rs1("fs44")%>　</a></td>
         <%
    if rs1("fs44")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=4&s=<%=s%>'><%=rs1("fs45")%>　</a></td>
         <%
    if rs1("fs45")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=4&s=<%=s%>'><%=rs1("fs46")%>　</a></td>
         <%
    if rs1("fs46")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=4&s=<%=s%>'><%=rs1("fs47")%>　</a></td>
         <%
    if rs1("fs47")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=4&s=<%=s%>'><%=rs1("fs48")%>　</a></td>
         <%
    if rs1("fs48")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=4&s=<%=s%>'><%=rs1("fs49")%>　</a></td>
         <%
    if rs1("fs49")<>"" then
    js=js+1
    end if
    %>
    
    <td align=center><a  href='bmxqfx.asp?jlh=11&mc=4&s=<%=s%>'><%=rs1("fs140")%>　</a></td>
       <%
    if rs1("fs140")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=4&s=<%=s%>'><%=rs1("fs141")%>　</a></td>
        <%
    if rs1("fs141")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=4&s=<%=s%>'><%=rs1("fs142")%>　</a></td>
         <%
    if rs1("fs142")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=4&s=<%=s%>'><%=rs1("fs143")%>　</a></td>
         <%
    if rs1("fs143")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=4&s=<%=s%>'><%=rs1("fs144")%>　</a></td>
         <%
    if rs1("fs144")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=4&s=<%=s%>'><%=rs1("fs145")%>　</a></td>
         <%
    if rs1("fs145")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=4&s=<%=s%>'><%=rs1("fs146")%>　</a></td>
         <%
    if rs1("fs146")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=4&s=<%=s%>'><%=rs1("fs147")%>　</a></td>
         <%
    if rs1("fs147")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=4&s=<%=s%>'><%=rs1("fs148")%>　</a></td>
         <%
    if rs1("fs148")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=4&s=<%=s%>'><%=rs1("fs149")%>　</a></td>
         <%
    if rs1("fs149")<>"" then
    js=js+1
    end if
    %>
   

<%
end if
%>

 <%
 if mc="5" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=5&s=<%=s%>'><%=rs1("fs50")%>　</a></td>
         <%
    if rs1("fs50")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=5&s=<%=s%>'><%=rs1("fs51")%>　</a></td>
          <%
    if rs1("fs51")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=5&s=<%=s%>'><%=rs1("fs52")%>　</a></td>
          <%
    if rs1("fs52")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=5&s=<%=s%>'><%=rs1("fs53")%>　</a></td>
          <%
    if rs1("fs53")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=5&s=<%=s%>'><%=rs1("fs54")%>　</a></td>
          <%
    if rs1("fs54")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=5&s=<%=s%>'><%=rs1("fs55")%>　</a></td>
          <%
    if rs1("fs55")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=5&s=<%=s%>'><%=rs1("fs56")%></a>　</td>
          <%
    if rs1("fs56")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=5&s=<%=s%>'><%=rs1("fs57")%>　</a></td>
          <%
    if rs1("fs57")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=5&s=<%=s%>'><%=rs1("fs58")%></a>　</td>
          <%
    if rs1("fs58")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=5&s=<%=s%>'><%=rs1("fs59")%>　</a></td>
          <%
    if rs1("fs59")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=11&mc=5&s=<%=s%>'><%=rs1("fs150")%>　</a></td>
         <%
    if rs1("fs150")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=5&s=<%=s%>'><%=rs1("fs151")%>　</a></td>
          <%
    if rs1("fs151")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=5&s=<%=s%>'><%=rs1("fs152")%>　</a></td>
          <%
    if rs1("fs152")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=5&s=<%=s%>'><%=rs1("fs153")%>　</a></td>
          <%
    if rs1("fs153")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=5&s=<%=s%>'><%=rs1("fs154")%>　</a></td>
          <%
    if rs1("fs154")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=5&s=<%=s%>'><%=rs1("fs155")%>　</a></td>
          <%
    if rs1("fs155")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=5&s=<%=s%>'><%=rs1("fs156")%></a>　</td>
          <%
    if rs1("fs156")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=5&s=<%=s%>'><%=rs1("fs157")%>　</a></td>
          <%
    if rs1("fs157")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=5&s=<%=s%>'><%=rs1("fs158")%></a>　</td>
          <%
    if rs1("fs158")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=5&s=<%=s%>'><%=rs1("fs159")%>　</a></td>
          <%
    if rs1("fs159")<>"" then
    js=js+1
    end if
    %>


<%
end if
%>


 <%
 if mc="6" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=6&s=<%=s%>'><%=rs1("fs60")%>　</a></td>
          <%
    if rs1("fs60")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=6&s=<%=s%>'><%=rs1("fs61")%>　</a></td>
           <%
    if rs1("fs61")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=6&s=<%=s%>'><%=rs1("fs62")%>　</a></td>
           <%
    if rs1("fs62")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=6&s=<%=s%>'><%=rs1("fs63")%>　</a></td>
           <%
    if rs1("fs63")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=6&s=<%=s%>'><%=rs1("fs64")%></a>　</td>
           <%
    if rs1("fs64")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=6&s=<%=s%>'><%=rs1("fs65")%>　</a></td>
           <%
    if rs1("fs65")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=6&s=<%=s%>'><%=rs1("fs66")%></a>　</td>
           <%
    if rs1("fs66")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=6&s=<%=s%>'><%=rs1("fs67")%>　</a></td>
           <%
    if rs1("fs67")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=6&s=<%=s%>'><%=rs1("fs68")%>　</a></td>
           <%
    if rs1("fs68")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=6&s=<%=s%>'><%=rs1("fs69")%>　</a></td>
           <%
    if rs1("fs69")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=11&mc=6&s=<%=s%>'><%=rs1("fs160")%>　</a></td>
          <%
    if rs1("fs160")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=6&s=<%=s%>'><%=rs1("fs161")%>　</a></td>
           <%
    if rs1("fs161")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=6&s=<%=s%>'><%=rs1("fs162")%>　</a></td>
           <%
    if rs1("fs162")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=6&s=<%=s%>'><%=rs1("fs163")%>　</a></td>
           <%
    if rs1("fs163")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=6&s=<%=s%>'><%=rs1("fs164")%></a>　</td>
           <%
    if rs1("fs164")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=6&s=<%=s%>'><%=rs1("fs165")%>　</a></td>
           <%
    if rs1("fs165")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=6&s=<%=s%>'><%=rs1("fs166")%></a>　</td>
           <%
    if rs1("fs166")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=6&s=<%=s%>'><%=rs1("fs167")%>　</a></td>
           <%
    if rs1("fs167")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=6&s=<%=s%>'><%=rs1("fs168")%>　</a></td>
           <%
    if rs1("fs168")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=6&s=<%=s%>'><%=rs1("fs169")%>　</a></td>
           <%
    if rs1("fs169")<>"" then
    js=js+1
    end if
    %>


<%
end if
%>

 <%
 if mc="7" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=7&s=<%=s%>'><%=rs1("fs70")%>　</a></td>
           <%
    if rs1("fs70")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=7&s=<%=s%>'><%=rs1("fs71")%>　</a></td>
            <%
    if rs1("fs71")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=7&s=<%=s%>'><%=rs1("fs72")%>　</a></td>
            <%
    if rs1("fs72")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=7&s=<%=s%>'><%=rs1("fs73")%>　</a></td>
            <%
    if rs1("fs73")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=7&s=<%=s%>'><%=rs1("fs74")%>　</a></td>
            <%
    if rs1("fs74")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=7&s=<%=s%>'><%=rs1("fs75")%>　</a></td>
            <%
    if rs1("fs75")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=7&s=<%=s%>'><%=rs1("fs76")%>　</a></td>
            <%
    if rs1("fs76")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=7&s=<%=s%>'><%=rs1("fs77")%>　</a></td>
            <%
    if rs1("fs77")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=7&s=<%=s%>'><%=rs1("fs78")%>　</a></td>
            <%
    if rs1("fs78")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=7&s=<%=s%>'><%=rs1("fs79")%>　</a></td>
            <%
    if rs1("fs79")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=11&mc=7&s=<%=s%>'><%=rs1("fs170")%>　</a></td>
           <%
    if rs1("fs170")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=7&s=<%=s%>'><%=rs1("fs171")%>　</a></td>
            <%
    if rs1("fs171")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=7&s=<%=s%>'><%=rs1("fs172")%>　</a></td>
            <%
    if rs1("fs172")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=7&s=<%=s%>'><%=rs1("fs173")%>　</a></td>
            <%
    if rs1("fs173")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=7&s=<%=s%>'><%=rs1("fs174")%>　</a></td>
            <%
    if rs1("fs174")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=7&s=<%=s%>'><%=rs1("fs175")%>　</a></td>
            <%
    if rs1("fs175")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=7&s=<%=s%>'><%=rs1("fs176")%>　</a></td>
            <%
    if rs1("fs176")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=7&s=<%=s%>'><%=rs1("fs177")%>　</a></td>
            <%
    if rs1("fs177")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=7&s=<%=s%>'><%=rs1("fs178")%>　</a></td>
            <%
    if rs1("fs178")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=7&s=<%=s%>'><%=rs1("fs179")%>　</a></td>
            <%
    if rs1("fs179")<>"" then
    js=js+1
    end if
    %>


<%
end if
%>


 <%
 if mc="8" then
 %>
   
    <td align=center><a  href='bmxqfx.asp?jlh=1&mc=8&s=<%=s%>'><%=rs1("fs80")%>　</a></td>
            <%
    if rs1("fs80")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=2&mc=8&s=<%=s%>'><%=rs1("fs81")%>　</a></td>
             <%
    if rs1("fs81")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=3&mc=8&s=<%=s%>'><%=rs1("fs82")%></a>　</td>
             <%
    if rs1("fs82")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=4&mc=8&s=<%=s%>'><%=rs1("fs83")%>　</a></td>
             <%
    if rs1("fs83")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=5&mc=8&s=<%=s%>'><%=rs1("fs84")%>　</a></td>
             <%
    if rs1("fs84")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=6&mc=8&s=<%=s%>'><%=rs1("fs85")%>　</a></td>
             <%
    if rs1("fs85")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=7&mc=8&s=<%=s%>'><%=rs1("fs86")%>　</a></td>
             <%
    if rs1("fs86")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=8&mc=8&s=<%=s%>'><%=rs1("fs87")%>　</a></td>
             <%
    if rs1("fs87")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=9&mc=8&s=<%=s%>'><%=rs1("fs88")%>　</a></td>
             <%
    if rs1("fs88")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=10&mc=8&s=<%=s%>'><%=rs1("fs89")%>　</a></td>
             <%
    if rs1("fs89")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=11&mc=8&s=<%=s%>'><%=rs1("fs180")%>　</a></td>
            <%
    if rs1("fs180")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=12&mc=8&s=<%=s%>'><%=rs1("fs181")%>　</a></td>
             <%
    if rs1("fs181")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=13&mc=8&s=<%=s%>'><%=rs1("fs182")%></a>　</td>
             <%
    if rs1("fs182")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=14&mc=8&s=<%=s%>'><%=rs1("fs183")%>　</a></td>
             <%
    if rs1("fs183")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=15&mc=8&s=<%=s%>'><%=rs1("fs184")%>　</a></td>
             <%
    if rs1("fs184")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=16&mc=8&s=<%=s%>'><%=rs1("fs185")%>　</a></td>
             <%
    if rs1("fs185")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=17&mc=8&s=<%=s%>'><%=rs1("fs186")%>　</a></td>
             <%
    if rs1("fs186")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=18&mc=8&s=<%=s%>'><%=rs1("fs187")%>　</a></td>
             <%
    if rs1("fs187")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=19&mc=8&s=<%=s%>'><%=rs1("fs188")%>　</a></td>
             <%
    if rs1("fs188")<>"" then
    js=js+1
    end if
    %>

    <td align=center><a  href='bmxqfx.asp?jlh=20&mc=8&s=<%=s%>'><%=rs1("fs189")%>　</a></td>
             <%
    if rs1("fs189")<>"" then
    js=js+1
    end if
    %>



   <%
end if
%>
    <td align=center><a  href='bmxqfx.asp?jlh=0&mc=<%=mc%>&s=<%=s%>'>悳蛍</td>
    <td align=center>峠譲蛍</td>
  
<%


i=1+(page-1)*10
do while not rs.eof and mypagesize>0 '----------宸戦議mypagesize>0音嬬卿��万頁柳竃儉桟議登僅訳周




xh=rs("xh")
xm=rs("xm")
xb=rs("xb")
zybj=rs("zybj")


  If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
	  

	Response.Write("</tr>")	 

	  	Response.Write("<tr bgcolor='"&sColor&"'>")
	  	%>
	  	<td align=center><font color="red"><%=i%></font>　</td>
	    <td align=center><%=zybj%>　</td>
 	    <td align=center><%=xh%>　</td>
    <td align=center><%=xm%>　</td>
	<td align=center><%=xb%>　</td>
		<%
 if mc="1" then
 %>
      <%
    if rs("fs10")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs10")%></font>　</td>
     
   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs10")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs11")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs11")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs11")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs12")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs12")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs12")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs13")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs13")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs13")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs14")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs14")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs14")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs15")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs15")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs15")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs16")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs16")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs16")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs17")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs17")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs17")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs18")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs18")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs18")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs19")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs19")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs19")%></font>　</td>

   <%
end if
  %>

    <%
    if rs("fs110")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs110")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs110")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs111")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs111")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs111")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs112")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs112")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs112")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs113")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs113")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs113")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs114")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs114")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs114")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs115")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs115")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs115")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs116")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs116")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs116")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs117")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs117")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs117")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs118")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs118")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs118")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs119")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs119")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs119")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="2" then
 %>
   
    
    <%
    if rs("fs20")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs20")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs20")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs21")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs21")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs21")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs22")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs22")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs22")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs23")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs23")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs23")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs24")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs24")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs24")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs25")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs25")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs25")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs26")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs26")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs26")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs27")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs27")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs27")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs28")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs28")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs28")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs29")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs29")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs29")%></font>　</td>

   <%
end if
    

  %>


  <%
    if rs("fs120")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs120")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs120")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs121")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs121")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs121")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs122")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs122")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs122")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs123")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs123")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs123")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs124")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs124")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs124")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs125")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs125")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs125")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs126")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs126")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs126")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs127")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs127")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs127")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs128")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs128")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs128")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs129")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs129")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs129")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="3" then
 %>
   
      <%
    if rs("fs30")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs30")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs30")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs31")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs31")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs31")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs32")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs32")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs32")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs33")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs33")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs33")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs34")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs34")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs34")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs35")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs35")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs35")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs36")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs36")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs36")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs37")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs37")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs37")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs38")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs38")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs38")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs39")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs39")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs39")%></font>　</td>

   <%
end if
    

  %>
  
  
    <%
    if rs("fs130")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs130")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs130")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs131")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs131")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs131")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs132")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs132")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs132")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs133")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs133")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs133")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs134")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs134")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs134")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs135")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs135")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs135")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs136")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs136")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs136")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs137")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs137")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs137")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs138")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs138")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs138")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs139")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs139")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs139")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>


 <%
 if mc="4" then
 %>
   
       <%
    if rs("fs40")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs40")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs40")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs41")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs41")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs41")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs42")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs42")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs42")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs43")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs43")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs43")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs44")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs44")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs44")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs45")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs45")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs45")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs46")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs46")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs46")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs47")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs47")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs47")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs48")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs48")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs48")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs49")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs49")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs49")%></font>　</td>

   <%
end if
    

  %>
  
   
       <%
    if rs("fs140")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs140")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs140")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs141")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs141")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs141")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs142")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs142")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs142")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs143")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs143")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs143")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs144")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs144")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs144")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs145")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs145")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs145")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs146")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs146")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs146")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs147")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs147")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs147")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs148")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs148")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs148")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs149")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs149")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs149")%></font>　</td>

   <%
end if
    
  %>
<%
end if
%>

 <%
 if mc="5" then
 %>
   
     <%
    if rs("fs50")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs50")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs50")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs51")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs51")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs51")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs52")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs52")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs52")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs53")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs53")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs53")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs54")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs54")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs54")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs55")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs55")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs55")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs56")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs56")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs56")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs57")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs57")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs57")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs58")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs58")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs58")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs59")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs59")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs59")%></font>　</td>

   <%
end if
    

  %>
  
    <%
    if rs("fs150")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs150")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs150")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs151")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs151")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs151")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs152")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs152")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs152")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs153")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs153")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs153")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs154")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs154")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs154")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs155")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs155")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs155")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs156")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs156")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs156")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs157")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs157")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs157")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs158")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs158")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs158")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs159")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs159")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs159")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>


 <%
 if mc="6" then
 %>
   
     <%
    if rs("fs60")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs60")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs60")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs61")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs61")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs61")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs62")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs62")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs62")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs63")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs63")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs63")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs64")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs64")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs64")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs65")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs65")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs65")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs66")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs66")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs66")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs67")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs67")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs67")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs68")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs68")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs68")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs69")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs69")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs69")%></font>　</td>

   <%
end if
    

  %>
  
   <%
    if rs("fs160")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs160")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs160")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs161")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs161")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs161")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs162")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs162")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs162")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs163")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs163")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs163")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs164")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs164")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs164")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs165")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs165")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs165")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs166")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs166")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs166")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs167")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs167")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs167")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs168")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs168")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs168")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs169")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs169")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs169")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="7" then
 %>
   
      <%
    if rs("fs70")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs70")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs70")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs71")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs71")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs71")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs72")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs72")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs72")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs73")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs73")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs73")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs74")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs74")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs74")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs75")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs75")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs75")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs76")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs76")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs76")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs77")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs77")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs77")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs78")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs78")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs78")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs79")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs79")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs79")%></font>　</td>

   <%
end if
    

  %>
  
   <%
    if rs("fs170")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs170")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs170")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs171")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs171")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs171")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs172")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs172")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs172")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs173")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs173")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs173")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs174")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs174")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs174")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs175")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs175")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs175")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs176")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs176")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs176")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs177")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs177")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs177")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs178")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs178")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs178")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs179")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs179")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs179")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="8" then
 %>
   
      <%
    if rs("fs80")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs80")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs80")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs81")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs81")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs81")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs82")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs82")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs82")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs83")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs83")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs83")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs84")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs84")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs84")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs85")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs85")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs85")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs86")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs86")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs86")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs87")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs87")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs87")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs88")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs88")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs88")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs89")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs89")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs89")%></font>　</td>

   <%
end if
    

  %>
  
      <%
    if rs("fs180")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs180")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs180")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs181")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs181")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs181")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs182")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs182")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs182")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs183")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs183")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs183")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs184")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs184")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs184")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs185")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs185")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs185")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs186")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs186")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs186")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs187")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs187")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs187")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs188")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs188")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs188")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs189")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs189")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs189")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>


<%
if mc="1" then
zf=rs("fs10")+rs("fs11")+rs("fs12")+rs("fs13")+rs("fs14")+rs("fs15")+rs("fs16")+rs("fs17")+rs("fs18")+rs("fs19")+rs("fs110")+rs("fs111")+rs("fs112")+rs("fs113")+rs("fs114")+rs("fs115")+rs("fs116")+rs("fs117")+rs("fs118")+rs("fs119")
%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="2" then
zf=rs("fs20")+rs("fs21")+rs("fs22")+rs("fs23")+rs("fs24")+rs("fs25")+rs("fs26")+rs("fs27")+rs("fs28")+rs("fs29")+rs("fs120")+rs("fs121")+rs("fs122")+rs("fs123")+rs("fs124")+rs("fs125")+rs("fs126")+rs("fs127")+rs("fs128")+rs("fs129")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="3" then
zf=rs("fs30")+rs("fs31")+rs("fs32")+rs("fs33")+rs("fs34")+rs("fs35")+rs("fs36")+rs("fs37")+rs("fs38")+rs("fs39")+rs("fs130")+rs("fs131")+rs("fs132")+rs("fs133")+rs("fs134")+rs("fs135")+rs("fs136")+rs("fs137")+rs("fs138")+rs("fs139")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="4" then
zf=rs("fs40")+rs("fs41")+rs("fs42")+rs("fs43")+rs("fs44")+rs("fs45")+rs("fs46")+rs("fs47")+rs("fs48")+rs("fs49")+rs("fs140")+rs("fs141")+rs("fs142")+rs("fs143")+rs("fs144")+rs("fs145")+rs("fs146")+rs("fs147")+rs("fs148")+rs("fs149")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="5" then
zf=rs("fs50")+rs("fs51")+rs("fs52")+rs("fs53")+rs("fs54")+rs("fs55")+rs("fs56")+rs("fs57")+rs("fs58")+rs("fs59")+rs("fs150")+rs("fs151")+rs("fs152")+rs("fs153")+rs("fs154")+rs("fs155")+rs("fs156")+rs("fs157")+rs("fs158")+rs("fs159")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="6" then
zf=rs("fs60")+rs("fs61")+rs("fs62")+rs("fs63")+rs("fs64")+rs("fs65")+rs("fs66")+rs("fs67")+rs("fs68")+rs("fs69")+rs("fs160")+rs("fs161")+rs("fs162")+rs("fs163")+rs("fs164")+rs("fs165")+rs("fs166")+rs("fs167")+rs("fs168")+rs("fs169")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="7" then
zf=rs("fs70")+rs("fs71")+rs("fs72")+rs("fs73")+rs("fs74")+rs("fs75")+rs("fs76")+rs("fs77")+rs("fs78")+rs("fs79")+rs("fs170")+rs("fs171")+rs("fs172")+rs("fs173")+rs("fs174")+rs("fs175")+rs("fs176")+rs("fs177")+rs("fs178")+rs("fs179")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="8" then
zf=rs("fs80")+rs("fs81")+rs("fs82")+rs("fs83")+rs("fs84")+rs("fs85")+rs("fs86")+rs("fs87")+rs("fs88")+rs("fs89")+rs("fs180")+rs("fs181")+rs("fs182")+rs("fs183")+rs("fs184")+rs("fs185")+rs("fs186")+rs("fs187")+rs("fs188")+rs("fs189")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>

<%
if js>0 then
if zf/js>=60 then
%>
<td align=center><font color=green><%=int(zf*100/js)/100%></font>　</td>
   <%
   else
   %>
 <td align=center><font color=red><%=int(zf*100/js)/100%></font>　</td>
  <%
  end if
  end if
  %>

 </tr>
   
 
    
 <%
 

mypagesize=mypagesize-1  '-------------譜協葎10 宸劔峪嬬儉桟10 肝 受葎0扮柳竃儉桟
i=i+1
rs.movenext
loop
'-------------------�塋昭蚤宍輯暴疂�

	Response.Write("</table><br><br>") 
	 
Response.Write("</center>")

%>
<table width="100%" border="0" align="center">
  <tr>
    <td>
      <div align="center">匈方��&nbsp; 
        <%
if page>1 then  '-------------------泌惚頁壓及匯匈參朔夸 �塋症碗子�
%>
        <a href=bmxqfx.asp?page=<%=page-1%>&jlh=<%=jlh%>&mc=<%=mc%>&s=<%=s%>>貧匯匈</a> 
        <%
end if
%>
        <%
if rs.pagecount<=10 then '---------------泌惚悳慌蛍匈方富噐賜吉噐10匈 夸峪喘12345678910�塋�
for j=1 to rs.pagecount 
response.write "[<a href=bmxqfx.asp?page="&j&"&jlh="&jlh&"&mc="&mc&"&s="&s&">"&j&"</a>]"
next
else '----------------泌惚謹噐10匈 夸念10匈喘12345678910炎竃
for j=1 to 10
response.write "[<a href='bmxqfx.asp?page="&j&"&jlh="&jlh&"&mc="&mc&"&s="&s&"'>"&j&"</a>]&nbsp;"
next
response.write  "[<a href='bmxqfx.asp?page="&rs.pagecount&"&jlh="&jlh&"&mc="&mc&"&s="&s&"' title='恷朔匯匈'>恷朔匯匈</a>]"
end if
'-------------恷朔匯匈
%>

<%
if page<rs.pagecount   then%>
        <a href='bmxqfx.asp?page=<%=page+1%>&jlh=<%=jlh%>&mc=<%=mc%>&s=<%=s%>'>和匯匈</a> 
 
        <%
end if
 
Response.Write("</table>") 
Response.Write("</center>")

%>
        
  <!--#include file="bjz1.asp"-->
  
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing

else

response.write"<script language='javascript'>" 
		 response.write"alert('低短嗤鞠村��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end

end if

%>
	   
    <p><!--#include file="bmxq1.asp"-->