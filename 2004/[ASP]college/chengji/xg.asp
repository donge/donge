<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%

 zybj=request("zybj")
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + zybj + "'"
 rs.open sql,conn,3,3
 zybj=request("zybj")
 s=request("s")
 byxf=request("byxf")
 glymm=request("glymm")

 fs10=request("fs10")
 fs11=request("fs11")
 fs12=request("fs12")
 fs13=request("fs13")
 fs14=request("fs14")
 fs15=request("fs15")
 fs16=request("fs16")
 fs17=request("fs17")
 fs18=request("fs18")
 fs19=request("fs19")

 fs20=request("fs20")
 fs21=request("fs21")
 fs22=request("fs22")
 fs23=request("fs23")
 fs24=request("fs24")
 fs25=request("fs25")
 fs26=request("fs26")
 fs27=request("fs27")
 fs28=request("fs28")
 fs29=request("fs29")

 fs30=request("fs30")
 fs31=request("fs31")
 fs32=request("fs32")
 fs33=request("fs33")
 fs34=request("fs34")
 fs35=request("fs35")
 fs36=request("fs36")
 fs37=request("fs37")
 fs38=request("fs38")
 fs39=request("fs39")

 fs40=request("fs40")
 fs41=request("fs41")
 fs42=request("fs42")
 fs43=request("fs43")
 fs44=request("fs44")
 fs45=request("fs45")
 fs46=request("fs46")
 fs47=request("fs47")
 fs48=request("fs48")
 fs49=request("fs49")
 
 fs50=request("fs50")
 fs51=request("fs51")
 fs52=request("fs52")
 fs53=request("fs53")
 fs54=request("fs54")
 fs55=request("fs55")
 fs56=request("fs56")
 fs57=request("fs57")
 fs58=request("fs58")
 fs59=request("fs59")

 fs60=request("fs60")
 fs61=request("fs61")
 fs62=request("fs62")
 fs63=request("fs63")
 fs64=request("fs64")
 fs65=request("fs65")
 fs66=request("fs66")
 fs67=request("fs67")
 fs68=request("fs68")
 fs69=request("fs69")

 fs70=request("fs70")
 fs71=request("fs71")
 fs72=request("fs72")
 fs73=request("fs73")
 fs74=request("fs74")
 fs75=request("fs75")
 fs76=request("fs76")
 fs77=request("fs77")
 fs78=request("fs78")
 fs79=request("fs79")

 fs80=request("fs80")
 fs81=request("fs81")
 fs82=request("fs82")
 fs83=request("fs83")
 fs84=request("fs84")
 fs85=request("fs85")
 fs86=request("fs86")
 fs87=request("fs87")
 fs88=request("fs88")
 fs89=request("fs89")

 fs110=request("fs110")
 fs111=request("fs111")
 fs112=request("fs112")
 fs113=request("fs113")
 fs114=request("fs114")
 fs115=request("fs115")
 fs116=request("fs116")
 fs117=request("fs117")
 fs118=request("fs118")
 fs119=request("fs119")

 fs120=request("fs120")
 fs121=request("fs121")
 fs122=request("fs122")
 fs123=request("fs123")
 fs124=request("fs124")
 fs125=request("fs125")
 fs126=request("fs126")
 fs127=request("fs127")
 fs128=request("fs128")
 fs129=request("fs129")

 fs130=request("fs130")
 fs131=request("fs131")
 fs132=request("fs132")
 fs133=request("fs133")
 fs134=request("fs134")
 fs135=request("fs135")
 fs136=request("fs136")
 fs137=request("fs137")
 fs138=request("fs138")
 fs139=request("fs139")

 fs140=request("fs140")
 fs141=request("fs141")
 fs142=request("fs142")
 fs143=request("fs143")
 fs144=request("fs144")
 fs145=request("fs145")
 fs146=request("fs146")
 fs147=request("fs147")
 fs148=request("fs148")
 fs149=request("fs149")
 
 fs150=request("fs150")
 fs151=request("fs151")
 fs152=request("fs152")
 fs153=request("fs153")
 fs154=request("fs154")
 fs155=request("fs155")
 fs156=request("fs156")
 fs157=request("fs157")
 fs158=request("fs158")
 fs159=request("fs159")

 fs160=request("fs160")
 fs161=request("fs161")
 fs162=request("fs162")
 fs163=request("fs163")
 fs164=request("fs164")
 fs165=request("fs165")
 fs166=request("fs166")
 fs167=request("fs167")
 fs168=request("fs168")
 fs169=request("fs169")

 fs170=request("fs170")
 fs171=request("fs171")
 fs172=request("fs172")
 fs173=request("fs173")
 fs174=request("fs174")
 fs175=request("fs175")
 fs176=request("fs176")
 fs177=request("fs177")
 fs178=request("fs178")
 fs179=request("fs179")

 fs180=request("fs180")
 fs181=request("fs181")
 fs182=request("fs182")
 fs183=request("fs183")
 fs184=request("fs184")
 fs185=request("fs185")
 fs186=request("fs186")
 fs187=request("fs187")
 fs188=request("fs188")
 fs189=request("fs189")


 conn.execute("update [zybjmc] set s='"&s&"',zybj='"&zybj&"',byxf='"&byxf&"',glymm='"&glymm&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs10='"&fs10&"',fs11='"&fs11&"',fs12='"&fs12&"',fs13='"&fs13&"',fs14='"&fs14&"',fs15='"&fs15&"',fs16='"&fs16&"',fs17='"&fs17&"',fs18='"&fs18&"',fs19='"&fs19&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs20='"&fs20&"',fs21='"&fs21&"',fs22='"&fs22&"',fs23='"&fs23&"',fs24='"&fs24&"',fs25='"&fs25&"',fs26='"&fs26&"',fs27='"&fs27&"',fs28='"&fs28&"',fs29='"&fs29&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs30='"&fs30&"',fs31='"&fs31&"',fs32='"&fs32&"',fs33='"&fs33&"',fs34='"&fs34&"',fs35='"&fs35&"',fs36='"&fs36&"',fs37='"&fs37&"',fs38='"&fs38&"',fs39='"&fs39&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs40='"&fs40&"',fs41='"&fs41&"',fs42='"&fs42&"',fs43='"&fs43&"',fs44='"&fs44&"',fs45='"&fs45&"',fs46='"&fs46&"',fs47='"&fs47&"',fs48='"&fs48&"',fs49='"&fs49&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs50='"&fs50&"',fs51='"&fs51&"',fs52='"&fs52&"',fs53='"&fs53&"',fs54='"&fs54&"',fs55='"&fs55&"',fs56='"&fs56&"',fs57='"&fs57&"',fs58='"&fs58&"',fs59='"&fs59&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs60='"&fs60&"',fs61='"&fs61&"',fs62='"&fs62&"',fs63='"&fs63&"',fs64='"&fs64&"',fs65='"&fs65&"',fs66='"&fs66&"',fs67='"&fs67&"',fs68='"&fs68&"',fs69='"&fs69&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs70='"&fs70&"',fs71='"&fs71&"',fs72='"&fs72&"',fs73='"&fs73&"',fs74='"&fs74&"',fs75='"&fs75&"',fs76='"&fs76&"',fs77='"&fs77&"',fs78='"&fs78&"',fs79='"&fs79&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs80='"&fs80&"',fs81='"&fs81&"',fs82='"&fs82&"',fs83='"&fs83&"',fs84='"&fs84&"',fs85='"&fs85&"',fs86='"&fs86&"',fs87='"&fs87&"',fs88='"&fs88&"',fs89='"&fs89&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs110='"&fs110&"',fs111='"&fs111&"',fs112='"&fs112&"',fs113='"&fs113&"',fs114='"&fs114&"',fs115='"&fs115&"',fs116='"&fs116&"',fs117='"&fs117&"',fs118='"&fs118&"',fs119='"&fs119&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs120='"&fs120&"',fs121='"&fs121&"',fs122='"&fs122&"',fs123='"&fs123&"',fs124='"&fs124&"',fs125='"&fs125&"',fs126='"&fs126&"',fs127='"&fs127&"',fs128='"&fs128&"',fs129='"&fs129&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs130='"&fs130&"',fs131='"&fs131&"',fs132='"&fs132&"',fs133='"&fs133&"',fs134='"&fs134&"',fs135='"&fs135&"',fs136='"&fs136&"',fs137='"&fs137&"',fs138='"&fs138&"',fs139='"&fs139&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs140='"&fs140&"',fs141='"&fs141&"',fs142='"&fs142&"',fs143='"&fs143&"',fs144='"&fs144&"',fs145='"&fs145&"',fs146='"&fs146&"',fs147='"&fs147&"',fs148='"&fs148&"',fs149='"&fs149&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs150='"&fs150&"',fs151='"&fs151&"',fs152='"&fs152&"',fs153='"&fs153&"',fs154='"&fs154&"',fs155='"&fs155&"',fs156='"&fs156&"',fs157='"&fs157&"',fs158='"&fs158&"',fs159='"&fs159&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs160='"&fs160&"',fs161='"&fs161&"',fs162='"&fs162&"',fs163='"&fs163&"',fs164='"&fs164&"',fs165='"&fs165&"',fs166='"&fs166&"',fs167='"&fs167&"',fs168='"&fs168&"',fs169='"&fs169&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs170='"&fs170&"',fs171='"&fs171&"',fs172='"&fs172&"',fs173='"&fs173&"',fs174='"&fs174&"',fs175='"&fs175&"',fs176='"&fs176&"',fs177='"&fs177&"',fs178='"&fs178&"',fs179='"&fs179&"' WHERE zybj='"&zybj&"'")
 conn.execute("update [zybjmc] set fs180='"&fs180&"',fs181='"&fs181&"',fs182='"&fs182&"',fs183='"&fs183&"',fs184='"&fs184&"',fs185='"&fs185&"',fs186='"&fs186&"',fs187='"&fs187&"',fs188='"&fs188&"',fs189='"&fs189&"' WHERE zybj='"&zybj&"'")








 response.write("<center>修改成功！<br><a href=findbj.asp?key="&zybj&">返回班级修改页面</a></center>") 

 
 
%>