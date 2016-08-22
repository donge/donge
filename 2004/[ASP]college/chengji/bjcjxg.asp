<!--#include file="conn.asp"-->
<%
 sj=request("sj")
 xhcs=request("xhcs")
gwssz=Application("gwssz")

 for i=1 to xhcs
 xh=gwssz(i)
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3


if sj="fs10" then
 fs10=request(i)
conn.execute("update [cxb] set fs10='"&fs10&"' WHERE xh='"&xh&"'")
end if

if sj="fs11" then
 fs11=request(i)
conn.execute("update [cxb] set fs11='"&fs11&"' WHERE xh='"&xh&"'")
end if

if sj="fs12" then
 fs12=request(i)
conn.execute("update [cxb] set fs12='"&fs12&"' WHERE xh='"&xh&"'")
end if

if sj="fs13" then
 fs13=request(i)
conn.execute("update [cxb] set fs13='"&fs13&"' WHERE xh='"&xh&"'")
end if

if sj="fs14" then
 fs14=request(i)
conn.execute("update [cxb] set fs14='"&fs14&"' WHERE xh='"&xh&"'")
end if

if sj="fs15" then
 fs15=request(i)
conn.execute("update [cxb] set fs15='"&fs15&"' WHERE xh='"&xh&"'")
end if

if sj="fs16" then
 fs16=request(i)
conn.execute("update [cxb] set fs16='"&fs16&"' WHERE xh='"&xh&"'")
end if

if sj="fs17" then
 fs17=request(i)
conn.execute("update [cxb] set fs17='"&fs17&"' WHERE xh='"&xh&"'")
end if

if sj="fs18" then
 fs18=request(i)
conn.execute("update [cxb] set fs18='"&fs18&"' WHERE xh='"&xh&"'")
end if

if sj="fs19" then
 fs19=request(i)
conn.execute("update [cxb] set fs19='"&fs19&"' WHERE xh='"&xh&"'")
end if




if sj="fs110" then
 fs110=request(i)
conn.execute("update [cxb] set fs110='"&fs110&"' WHERE xh='"&xh&"'")
end if

if sj="fs111" then
 fs111=request(i)
conn.execute("update [cxb] set fs111='"&fs111&"' WHERE xh='"&xh&"'")
end if

if sj="fs112" then
 fs112=request(i)
conn.execute("update [cxb] set fs112='"&fs112&"' WHERE xh='"&xh&"'")
end if

if sj="fs113" then
 fs113=request(i)
conn.execute("update [cxb] set fs113='"&fs113&"' WHERE xh='"&xh&"'")
end if

if sj="fs114" then
 fs114=request(i)
conn.execute("update [cxb] set fs114='"&fs114&"' WHERE xh='"&xh&"'")
end if

if sj="fs115" then
 fs115=request(i)
conn.execute("update [cxb] set fs115='"&fs115&"' WHERE xh='"&xh&"'")
end if

if sj="fs116" then
 fs116=request(i)
conn.execute("update [cxb] set fs116='"&fs116&"' WHERE xh='"&xh&"'")
end if

if sj="fs117" then
 fs117=request(i)
conn.execute("update [cxb] set fs117='"&fs117&"' WHERE xh='"&xh&"'")
end if

if sj="fs118" then
 fs118=request(i)
conn.execute("update [cxb] set fs118='"&fs118&"' WHERE xh='"&xh&"'")
end if

if sj="fs119" then
 fs119=request(i)
conn.execute("update [cxb] set fs119='"&fs119&"' WHERE xh='"&xh&"'")
end if







if sj="fs20" then
 fs20=request(i)
conn.execute("update [cxb] set fs20='"&fs20&"' WHERE xh='"&xh&"'")
end if

if sj="fs21" then
 fs21=request(i)
conn.execute("update [cxb] set fs21='"&fs21&"' WHERE xh='"&xh&"'")
end if

if sj="fs22" then
 fs22=request(i)
conn.execute("update [cxb] set fs22='"&fs22&"' WHERE xh='"&xh&"'")
end if

if sj="fs23" then
 fs23=request(i)
conn.execute("update [cxb] set fs23='"&fs23&"' WHERE xh='"&xh&"'")
end if

if sj="fs24" then
 fs24=request(i)
conn.execute("update [cxb] set fs24='"&fs24&"' WHERE xh='"&xh&"'")
end if

if sj="fs25" then
 fs25=request(i)
conn.execute("update [cxb] set fs25='"&fs25&"' WHERE xh='"&xh&"'")
end if

if sj="fs26" then
 fs26=request(i)
conn.execute("update [cxb] set fs26='"&fs26&"' WHERE xh='"&xh&"'")
end if

if sj="fs27" then
 fs27=request(i)
conn.execute("update [cxb] set fs27='"&fs27&"' WHERE xh='"&xh&"'")
end if

if sj="fs28" then
 fs28=request(i)
conn.execute("update [cxb] set fs28='"&fs28&"' WHERE xh='"&xh&"'")
end if

if sj="fs29" then
 fs29=request(i)
conn.execute("update [cxb] set fs29='"&fs29&"' WHERE xh='"&xh&"'")
end if



if sj="fs120" then
 fs120=request(i)
conn.execute("update [cxb] set fs120='"&fs120&"' WHERE xh='"&xh&"'")
end if

if sj="fs121" then
 fs121=request(i)
conn.execute("update [cxb] set fs121='"&fs121&"' WHERE xh='"&xh&"'")
end if

if sj="fs122" then
 fs122=request(i)
conn.execute("update [cxb] set fs122='"&fs122&"' WHERE xh='"&xh&"'")
end if

if sj="fs123" then
 fs123=request(i)
conn.execute("update [cxb] set fs123='"&fs123&"' WHERE xh='"&xh&"'")
end if

if sj="fs124" then
 fs124=request(i)
conn.execute("update [cxb] set fs124='"&fs124&"' WHERE xh='"&xh&"'")
end if

if sj="fs125" then
 fs125=request(i)
conn.execute("update [cxb] set fs125='"&fs125&"' WHERE xh='"&xh&"'")
end if

if sj="fs126" then
 fs126=request(i)
conn.execute("update [cxb] set fs126='"&fs126&"' WHERE xh='"&xh&"'")
end if

if sj="fs127" then
 fs127=request(i)
conn.execute("update [cxb] set fs127='"&fs127&"' WHERE xh='"&xh&"'")
end if

if sj="fs128" then
 fs128=request(i)
conn.execute("update [cxb] set fs128='"&fs128&"' WHERE xh='"&xh&"'")
end if

if sj="fs129" then
 fs129=request(i)
conn.execute("update [cxb] set fs129='"&fs129&"' WHERE xh='"&xh&"'")
end if









if sj="fs30" then
 fs30=request(i)
conn.execute("update [cxb] set fs30='"&fs30&"' WHERE xh='"&xh&"'")
end if

if sj="fs31" then
 fs31=request(i)
conn.execute("update [cxb] set fs31='"&fs31&"' WHERE xh='"&xh&"'")
end if

if sj="fs32" then
 fs32=request(i)
conn.execute("update [cxb] set fs32='"&fs32&"' WHERE xh='"&xh&"'")
end if

if sj="fs33" then
 fs33=request(i)
conn.execute("update [cxb] set fs33='"&fs33&"' WHERE xh='"&xh&"'")
end if

if sj="fs34" then
 fs34=request(i)
conn.execute("update [cxb] set fs34='"&fs34&"' WHERE xh='"&xh&"'")
end if

if sj="fs35" then
 fs35=request(i)
conn.execute("update [cxb] set fs35='"&fs35&"' WHERE xh='"&xh&"'")
end if

if sj="fs36" then
 fs36=request(i)
conn.execute("update [cxb] set fs36='"&fs36&"' WHERE xh='"&xh&"'")
end if

if sj="fs37" then
 fs37=request(i)
conn.execute("update [cxb] set fs37='"&fs37&"' WHERE xh='"&xh&"'")
end if

if sj="fs38" then
 fs38=request(i)
conn.execute("update [cxb] set fs38='"&fs38&"' WHERE xh='"&xh&"'")
end if

if sj="fs39" then
 fs39=request(i)
conn.execute("update [cxb] set fs39='"&fs39&"' WHERE xh='"&xh&"'")
end if


if sj="fs130" then
 fs130=request(i)
conn.execute("update [cxb] set fs130='"&fs130&"' WHERE xh='"&xh&"'")
end if

if sj="fs131" then
 fs131=request(i)
conn.execute("update [cxb] set fs131='"&fs131&"' WHERE xh='"&xh&"'")
end if

if sj="fs132" then
 fs132=request(i)
conn.execute("update [cxb] set fs132='"&fs132&"' WHERE xh='"&xh&"'")
end if

if sj="fs133" then
 fs133=request(i)
conn.execute("update [cxb] set fs133='"&fs133&"' WHERE xh='"&xh&"'")
end if

if sj="fs134" then
 fs134=request(i)
conn.execute("update [cxb] set fs134='"&fs134&"' WHERE xh='"&xh&"'")
end if

if sj="fs135" then
 fs135=request(i)
conn.execute("update [cxb] set fs135='"&fs135&"' WHERE xh='"&xh&"'")
end if

if sj="fs136" then
 fs136=request(i)
conn.execute("update [cxb] set fs136='"&fs136&"' WHERE xh='"&xh&"'")
end if

if sj="fs137" then
 fs137=request(i)
conn.execute("update [cxb] set fs137='"&fs137&"' WHERE xh='"&xh&"'")
end if

if sj="fs138" then
 fs138=request(i)
conn.execute("update [cxb] set fs138='"&fs138&"' WHERE xh='"&xh&"'")
end if

if sj="fs139" then
 fs139=request(i)
conn.execute("update [cxb] set fs139='"&fs139&"' WHERE xh='"&xh&"'")
end if








if sj="fs40" then
 fs40=request(i)
conn.execute("update [cxb] set fs40='"&fs40&"' WHERE xh='"&xh&"'")
end if

if sj="fs41" then
 fs41=request(i)
conn.execute("update [cxb] set fs41='"&fs41&"' WHERE xh='"&xh&"'")
end if

if sj="fs42" then
 fs42=request(i)
conn.execute("update [cxb] set fs42='"&fs42&"' WHERE xh='"&xh&"'")
end if

if sj="fs43" then
 fs43=request(i)
conn.execute("update [cxb] set fs43='"&fs43&"' WHERE xh='"&xh&"'")
end if

if sj="fs44" then
 fs44=request(i)
conn.execute("update [cxb] set fs44='"&fs44&"' WHERE xh='"&xh&"'")
end if

if sj="fs45" then
 fs45=request(i)
conn.execute("update [cxb] set fs45='"&fs45&"' WHERE xh='"&xh&"'")
end if

if sj="fs46" then
 fs46=request(i)
conn.execute("update [cxb] set fs46='"&fs46&"' WHERE xh='"&xh&"'")
end if

if sj="fs47" then
 fs47=request(i)
conn.execute("update [cxb] set fs47='"&fs47&"' WHERE xh='"&xh&"'")
end if

if sj="fs48" then
 fs48=request(i)
conn.execute("update [cxb] set fs48='"&fs48&"' WHERE xh='"&xh&"'")
end if

if sj="fs49" then
 fs49=request(i)
conn.execute("update [cxb] set fs49='"&fs49&"' WHERE xh='"&xh&"'")
end if



if sj="fs140" then
 fs140=request(i)
conn.execute("update [cxb] set fs140='"&fs140&"' WHERE xh='"&xh&"'")
end if

if sj="fs141" then
 fs141=request(i)
conn.execute("update [cxb] set fs141='"&fs141&"' WHERE xh='"&xh&"'")
end if

if sj="fs142" then
 fs142=request(i)
conn.execute("update [cxb] set fs142='"&fs142&"' WHERE xh='"&xh&"'")
end if

if sj="fs143" then
 fs143=request(i)
conn.execute("update [cxb] set fs143='"&fs143&"' WHERE xh='"&xh&"'")
end if

if sj="fs144" then
 fs144=request(i)
conn.execute("update [cxb] set fs144='"&fs144&"' WHERE xh='"&xh&"'")
end if

if sj="fs145" then
 fs145=request(i)
conn.execute("update [cxb] set fs145='"&fs145&"' WHERE xh='"&xh&"'")
end if

if sj="fs146" then
 fs146=request(i)
conn.execute("update [cxb] set fs146='"&fs146&"' WHERE xh='"&xh&"'")
end if

if sj="fs147" then
 fs147=request(i)
conn.execute("update [cxb] set fs147='"&fs147&"' WHERE xh='"&xh&"'")
end if

if sj="fs148" then
 fs148=request(i)
conn.execute("update [cxb] set fs148='"&fs148&"' WHERE xh='"&xh&"'")
end if

if sj="fs149" then
 fs149=request(i)
conn.execute("update [cxb] set fs149='"&fs149&"' WHERE xh='"&xh&"'")
end if











if sj="fs50" then
 fs50=request(i)
conn.execute("update [cxb] set fs50='"&fs50&"' WHERE xh='"&xh&"'")
end if

if sj="fs51" then
 fs51=request(i)
conn.execute("update [cxb] set fs51='"&fs51&"' WHERE xh='"&xh&"'")
end if

if sj="fs52" then
 fs52=request(i)
conn.execute("update [cxb] set fs52='"&fs52&"' WHERE xh='"&xh&"'")
end if

if sj="fs53" then
 fs53=request(i)
conn.execute("update [cxb] set fs53='"&fs53&"' WHERE xh='"&xh&"'")
end if

if sj="fs54" then
 fs54=request(i)
conn.execute("update [cxb] set fs54='"&fs54&"' WHERE xh='"&xh&"'")
end if

if sj="fs55" then
 fs55=request(i)
conn.execute("update [cxb] set fs55='"&fs55&"' WHERE xh='"&xh&"'")
end if

if sj="fs56" then
 fs56=request(i)
conn.execute("update [cxb] set fs56='"&fs56&"' WHERE xh='"&xh&"'")
end if

if sj="fs57" then
 fs57=request(i)
conn.execute("update [cxb] set fs57='"&fs57&"' WHERE xh='"&xh&"'")
end if

if sj="fs58" then
 fs58=request(i)
conn.execute("update [cxb] set fs58='"&fs58&"' WHERE xh='"&xh&"'")
end if

if sj="fs59" then
 fs59=request(i)
conn.execute("update [cxb] set fs59='"&fs59&"' WHERE xh='"&xh&"'")
end if




if sj="fs150" then
 fs150=request(i)
conn.execute("update [cxb] set fs150='"&fs150&"' WHERE xh='"&xh&"'")
end if

if sj="fs151" then
 fs151=request(i)
conn.execute("update [cxb] set fs151='"&fs151&"' WHERE xh='"&xh&"'")
end if

if sj="fs152" then
 fs152=request(i)
conn.execute("update [cxb] set fs152='"&fs152&"' WHERE xh='"&xh&"'")
end if

if sj="fs153" then
 fs153=request(i)
conn.execute("update [cxb] set fs153='"&fs153&"' WHERE xh='"&xh&"'")
end if

if sj="fs154" then
 fs154=request(i)
conn.execute("update [cxb] set fs154='"&fs154&"' WHERE xh='"&xh&"'")
end if

if sj="fs155" then
 fs155=request(i)
conn.execute("update [cxb] set fs155='"&fs155&"' WHERE xh='"&xh&"'")
end if

if sj="fs156" then
 fs156=request(i)
conn.execute("update [cxb] set fs156='"&fs156&"' WHERE xh='"&xh&"'")
end if

if sj="fs157" then
 fs157=request(i)
conn.execute("update [cxb] set fs157='"&fs157&"' WHERE xh='"&xh&"'")
end if

if sj="fs158" then
 fs158=request(i)
conn.execute("update [cxb] set fs158='"&fs158&"' WHERE xh='"&xh&"'")
end if

if sj="fs159" then
 fs159=request(i)
conn.execute("update [cxb] set fs159='"&fs159&"' WHERE xh='"&xh&"'")
end if








if sj="fs60" then
 fs60=request(i)
conn.execute("update [cxb] set fs60='"&fs60&"' WHERE xh='"&xh&"'")
end if

if sj="fs61" then
 fs61=request(i)
conn.execute("update [cxb] set fs61='"&fs61&"' WHERE xh='"&xh&"'")
end if

if sj="fs62" then
 fs62=request(i)
conn.execute("update [cxb] set fs62='"&fs62&"' WHERE xh='"&xh&"'")
end if

if sj="fs63" then
 fs63=request(i)
conn.execute("update [cxb] set fs63='"&fs63&"' WHERE xh='"&xh&"'")
end if

if sj="fs64" then
 fs64=request(i)
conn.execute("update [cxb] set fs64='"&fs64&"' WHERE xh='"&xh&"'")
end if

if sj="fs65" then
 fs65=request(i)
conn.execute("update [cxb] set fs65='"&fs65&"' WHERE xh='"&xh&"'")
end if

if sj="fs66" then
 fs66=request(i)
conn.execute("update [cxb] set fs66='"&fs66&"' WHERE xh='"&xh&"'")
end if

if sj="fs67" then
 fs67=request(i)
conn.execute("update [cxb] set fs67='"&fs67&"' WHERE xh='"&xh&"'")
end if

if sj="fs68" then
 fs68=request(i)
conn.execute("update [cxb] set fs68='"&fs68&"' WHERE xh='"&xh&"'")
end if

if sj="fs69" then
 fs69=request(i)
conn.execute("update [cxb] set fs69='"&fs69&"' WHERE xh='"&xh&"'")
end if



if sj="fs160" then
 fs160=request(i)
conn.execute("update [cxb] set fs160='"&fs160&"' WHERE xh='"&xh&"'")
end if

if sj="fs161" then
 fs161=request(i)
conn.execute("update [cxb] set fs161='"&fs161&"' WHERE xh='"&xh&"'")
end if

if sj="fs162" then
 fs162=request(i)
conn.execute("update [cxb] set fs162='"&fs162&"' WHERE xh='"&xh&"'")
end if

if sj="fs163" then
 fs163=request(i)
conn.execute("update [cxb] set fs163='"&fs163&"' WHERE xh='"&xh&"'")
end if

if sj="fs164" then
 fs164=request(i)
conn.execute("update [cxb] set fs164='"&fs164&"' WHERE xh='"&xh&"'")
end if

if sj="fs165" then
 fs165=request(i)
conn.execute("update [cxb] set fs165='"&fs165&"' WHERE xh='"&xh&"'")
end if

if sj="fs166" then
 fs166=request(i)
conn.execute("update [cxb] set fs166='"&fs166&"' WHERE xh='"&xh&"'")
end if

if sj="fs167" then
 fs167=request(i)
conn.execute("update [cxb] set fs167='"&fs167&"' WHERE xh='"&xh&"'")
end if

if sj="fs168" then
 fs168=request(i)
conn.execute("update [cxb] set fs168='"&fs168&"' WHERE xh='"&xh&"'")
end if

if sj="fs169" then
 fs169=request(i)
conn.execute("update [cxb] set fs169='"&fs169&"' WHERE xh='"&xh&"'")
end if







if sj="fs70" then
 fs70=request(i)
conn.execute("update [cxb] set fs70='"&fs70&"' WHERE xh='"&xh&"'")
end if

if sj="fs71" then
 fs71=request(i)
conn.execute("update [cxb] set fs71='"&fs71&"' WHERE xh='"&xh&"'")
end if

if sj="fs72" then
 fs72=request(i)
conn.execute("update [cxb] set fs72='"&fs72&"' WHERE xh='"&xh&"'")
end if

if sj="fs73" then
 fs73=request(i)
conn.execute("update [cxb] set fs73='"&fs73&"' WHERE xh='"&xh&"'")
end if

if sj="fs74" then
 fs74=request(i)
conn.execute("update [cxb] set fs74='"&fs74&"' WHERE xh='"&xh&"'")
end if

if sj="fs75" then
 fs75=request(i)
conn.execute("update [cxb] set fs75='"&fs75&"' WHERE xh='"&xh&"'")
end if

if sj="fs76" then
 fs76=request(i)
conn.execute("update [cxb] set fs76='"&fs76&"' WHERE xh='"&xh&"'")
end if

if sj="fs77" then
 fs77=request(i)
conn.execute("update [cxb] set fs77='"&fs77&"' WHERE xh='"&xh&"'")
end if

if sj="fs78" then
 fs78=request(i)
conn.execute("update [cxb] set fs78='"&fs78&"' WHERE xh='"&xh&"'")
end if

if sj="fs79" then
 fs79=request(i)
conn.execute("update [cxb] set fs79='"&fs79&"' WHERE xh='"&xh&"'")
end if



if sj="fs170" then
 fs170=request(i)
conn.execute("update [cxb] set fs170='"&fs170&"' WHERE xh='"&xh&"'")
end if

if sj="fs171" then
 fs171=request(i)
conn.execute("update [cxb] set fs171='"&fs171&"' WHERE xh='"&xh&"'")
end if

if sj="fs172" then
 fs172=request(i)
conn.execute("update [cxb] set fs172='"&fs172&"' WHERE xh='"&xh&"'")
end if

if sj="fs173" then
 fs173=request(i)
conn.execute("update [cxb] set fs173='"&fs173&"' WHERE xh='"&xh&"'")
end if

if sj="fs174" then
 fs174=request(i)
conn.execute("update [cxb] set fs174='"&fs174&"' WHERE xh='"&xh&"'")
end if

if sj="fs175" then
 fs175=request(i)
conn.execute("update [cxb] set fs175='"&fs175&"' WHERE xh='"&xh&"'")
end if

if sj="fs176" then
 fs176=request(i)
conn.execute("update [cxb] set fs176='"&fs176&"' WHERE xh='"&xh&"'")
end if

if sj="fs177" then
 fs177=request(i)
conn.execute("update [cxb] set fs177='"&fs177&"' WHERE xh='"&xh&"'")
end if

if sj="fs178" then
 fs178=request(i)
conn.execute("update [cxb] set fs178='"&fs178&"' WHERE xh='"&xh&"'")
end if

if sj="fs179" then
 fs179=request(i)
conn.execute("update [cxb] set fs179='"&fs179&"' WHERE xh='"&xh&"'")
end if








if sj="fs80" then
 fs80=request(i)
conn.execute("update [cxb] set fs80='"&fs80&"' WHERE xh='"&xh&"'")
end if

if sj="fs81" then
 fs81=request(i)
conn.execute("update [cxb] set fs81='"&fs81&"' WHERE xh='"&xh&"'")
end if

if sj="fs82" then
 fs82=request(i)
conn.execute("update [cxb] set fs82='"&fs82&"' WHERE xh='"&xh&"'")
end if

if sj="fs83" then
 fs83=request(i)
conn.execute("update [cxb] set fs83='"&fs83&"' WHERE xh='"&xh&"'")
end if

if sj="fs84" then
 fs84=request(i)
conn.execute("update [cxb] set fs84='"&fs84&"' WHERE xh='"&xh&"'")
end if

if sj="fs85" then
 fs85=request(i)
conn.execute("update [cxb] set fs85='"&fs85&"' WHERE xh='"&xh&"'")
end if

if sj="fs86" then
 fs86=request(i)
conn.execute("update [cxb] set fs86='"&fs86&"' WHERE xh='"&xh&"'")
end if

if sj="fs87" then
 fs87=request(i)
conn.execute("update [cxb] set fs87='"&fs87&"' WHERE xh='"&xh&"'")
end if

if sj="fs88" then
 fs88=request(i)
conn.execute("update [cxb] set fs88='"&fs88&"' WHERE xh='"&xh&"'")
end if

if sj="fs89" then
 fs89=request(i)
conn.execute("update [cxb] set fs89='"&fs89&"' WHERE xh='"&xh&"'")
end if



if sj="fs180" then
 fs180=request(i)
conn.execute("update [cxb] set fs180='"&fs180&"' WHERE xh='"&xh&"'")
end if

if sj="fs181" then
 fs181=request(i)
conn.execute("update [cxb] set fs181='"&fs181&"' WHERE xh='"&xh&"'")
end if

if sj="fs182" then
 fs182=request(i)
conn.execute("update [cxb] set fs182='"&fs182&"' WHERE xh='"&xh&"'")
end if

if sj="fs183" then
 fs183=request(i)
conn.execute("update [cxb] set fs183='"&fs183&"' WHERE xh='"&xh&"'")
end if

if sj="fs184" then
 fs184=request(i)
conn.execute("update [cxb] set fs184='"&fs184&"' WHERE xh='"&xh&"'")
end if

if sj="fs185" then
 fs185=request(i)
conn.execute("update [cxb] set fs185='"&fs185&"' WHERE xh='"&xh&"'")
end if

if sj="fs186" then
 fs186=request(i)
conn.execute("update [cxb] set fs186='"&fs186&"' WHERE xh='"&xh&"'")
end if

if sj="fs187" then
 fs187=request(i)
conn.execute("update [cxb] set fs187='"&fs187&"' WHERE xh='"&xh&"'")
end if

if sj="fs188" then
 fs188=request(i)
conn.execute("update [cxb] set fs188='"&fs188&"' WHERE xh='"&xh&"'")
end if

if sj="fs189" then
 fs189=request(i)
conn.execute("update [cxb] set fs189='"&fs189&"' WHERE xh='"&xh&"'")
end if





next

 response.write("<center><font color=red size=5> 录入或修改成功！</font></center>") 


%>

<p>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<!--#include file="gws.html"-->