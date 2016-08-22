<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.Buffer = True
Server.ScriptTimeOut = 90
Session.CodePage=65001%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="UTF-8" />
<title>LBS DataBase Convert To PJBlog2 DataBase</title>
<style>
 body{margin:8px;font-family:verdana;font-size:12px;}
 .title{font-size:20px;font-weight:bold;padding:6px;border-bottom:8px solid #6f7eea;}
 .mainform{line-height:200%;}
 .bu{border:1px solid #8ea6c6}
 .RP{border:1px dotted #56462c;background:#ffffee;padding:4px;}
 ol{margin-top:2px;margin-bottom:2px}
 ol b {color:#142bc9}
</style>
<script>
 function GetPath(){
 	  var hrefLen=location.href.lastIndexOf("/")
      var Fhref=location.href.substr(0,hrefLen+1)
      return Fhref
 }
</script>
</head>
<body>
 <div class="title">LBS DataBase Convert To PJBlog2.5 DataBase</div>
 <div class="mainform">
  <form action="" method="post">
   <b>　&nbsp;&nbsp; 源数据库:</b> 
   <script>document.write (GetPath())</script> <input type="text" name="Source" size="40" class="bu" value="blog.mdb"/>
   <br/>
   <b>留言本数据库:</b> <script>document.write (GetPath())</script> <input type="text" name="SGbook" size="40" class="bu" value=""/>
   <br/>
   <b>&nbsp;&nbsp; 输出数据库:</b> 
   <script>document.write (GetPath())</script> <input type="text" name="Target" size="40" class="bu" value="new.mdb"/>
   <br/>
   <b>　　　注意:</b> 
   <span style="color:#f00">转换后目标数据如有数据将会被重新写入</span><br/>
  <input type="submit" value="开始转换"/>
  <input type="hidden" name="action" value="DoConvert"/>
  </form>
  <%
  if request.form("action")="DoConvert" then
		    dim SourcePath,SGbookPath,TargetPath,FSO,connS,connT,TempPath
		    TempPath="ConvertData/PBLog2.mdb"
		    Set FSO=Server.CreateObject("Scripting.FileSystemObject")
		    SourcePath=request.form("Source")
			SGbookPath=request.Form("SGbook")
		    TargetPath=request.form("Target")
		'================检测接受数据==========================
		    if len(SourcePath)<1 or len(TargetPath)<1 then 
			     Response.Redirect("PLBlogToPJblog.asp")
			     response.end 
		    end if
			
		    if SourcePath=TargetPath then
			     response.write "<div class=""RP"">源数据与目标数据路径一致无法转换!</div>"
			     response.end 
		    end if
		    
		    if not FSO.FileExists(Server.MapPath(SourcePath)) then
			     response.write "<div class=""RP"">源数据库不存在!</div>"
			     response.end 
		    end if
		    FSO.CopyFile Server.MapPath(TempPath),Server.MapPath(TargetPath)
		'=======================连接数据库===========================
		  	Set connS= Server.CreateObject("ADODB.Connection")
			connS.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(SourcePath)
			connS.Open
		  	Set connT= Server.CreateObject("ADODB.Connection")
			connT.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(TargetPath)
			connT.Open
		  If Err Then
			    err.Clear
				set connS=nothing
				set connT=nothing
			    response.write "<div class=""RP"">数据库连接失败!</div>"
			    Response.End
		  End If
		  
		'--------------------开始进行转换-----------------------
		    response.write "<div class=""RP""><ol>"
		    response.write "<li>开始转换Blog基本信息</li>"
		    response.write "<li>复制原始PJBlog2数据库到目标数据库地址:<b>"&TargetPath&"</b></li>"
	        dim SCount
	  '--------------------开始复制评论信息-----------------------
		    dim TComment,SComment
		    set SComment=connS.execute ("select * from blog_Comment")
            Set TComment=Server.CreateObject("ADODB.RecordSet")
            TComment.Open "select * from blog_Comment",ConnT,1,2
            do until SComment.eof
             TComment.addnew
             TComment("comm_ID")=SComment("comm_id")
             TComment("blog_ID")=SComment("log_id")
             TComment("comm_Content")=SComment("comm_Content")
             TComment("comm_Author")=SComment("comm_Author")
             TComment("comm_postTime")=SComment("comm_PostTime")
             TComment("comm_DisSM")=0
             TComment("comm_DisUBB")=0
             TComment("comm_DisIMG")=0
             TComment("comm_AutoURL")=1
             TComment("comm_AutoKEY")=0
             TComment("comm_PostIP")=SComment("comm_ip")
             SCount=SCount+1
             TComment.update
             SComment.movenext
            loop
		    response.write "<li>已经复制了<b>"&SCount&"</b>条评论信息</li>"
	  '--------------------开始日志内容信息-----------------------
		    dim TContent,SContent
		    SCount=0
		    set SContent=connS.execute ("select * from blog_Article")
            Set TContent=Server.CreateObject("ADODB.RecordSet")
            TContent.Open "select * from blog_Content",ConnT,1,2
	        do until SContent.eof
             TContent.addnew
             TContent("log_ID")=SContent("log_id")
             TContent("log_CateID")=SContent("log_catID")
             TContent("log_Title")=SContent("log_title")
             TContent("log_Author")=SContent("log_author")
             TContent("log_Modify")=""
             TContent("log_From")="本站原创"
             TContent("log_FromUrl")="#"
             TContent("log_Quote")=SContent("log_trackbackURL")
             TContent("log_Content")=SContent("log_content0")+SContent("log_content1")
             TContent("log_PostTime")=SContent("log_postTime")
             TContent("log_CommNums")=SContent("log_commentCount")
             TContent("log_ViewNums")=SContent("log_viewCount")
             TContent("log_QuoteNums")=SContent("log_trackbackCount")
             TContent("log_ubbFlags")="000111"
             TContent("log_IsShow")=not SContent("log_locked")
             TContent("log_DisComment")=false
             TContent("log_IsTop")=false
             TContent("log_weather")="sunny"
             if SContent("log_selected") then
                TContent("log_level")="level5"
              else
                TContent("log_level")="level3"
             end if
             if SContent("log_mode")=1 then
                TContent("log_edittype")=1
                TContent("log_Intro")=closeUBB(SplitLines(HTMLEncode(SContent("log_content0")),4))
              else
                TContent("log_edittype")=0
                TContent("log_Intro")=closeHTML(SplitLines(SContent("log_content0"),4))
             end if
             TContent("log_comorder")=true
			 TContent("log_mf")=""
			 TContent("log_IsDraft")=0
			 TContent("log_tag")=""
	         TContent.update
             SCount=SCount+1
             SContent.movenext
	        loop
		    response.write "<li>已经复制了<b>"&SCount&"</b>条日志信息</li>"
        '--------------------开始复制日志分类信息-----------------------
		    dim TCategory,SCategory
		    SCount=0
		    set SCategory=connS.execute ("select * from blog_Category")
            Set TCategory=Server.CreateObject("ADODB.RecordSet")
            TCategory.Open "select * from blog_Category",ConnT,1,2
	        do until SCategory.eof
	             TCategory.addnew
	             TCategory("cate_ID")=SCategory("cat_id")
	             TCategory("cate_Name")=SCategory("cat_name")
	             TCategory("cate_Order")=SCategory("cat_order")
	             TCategory("cate_Intro")=SCategory("cat_name")
	             TCategory("cate_OutLink")=false
	             TCategory("cate_URL")=""
	             TCategory("cate_Lock")=SCategory("cat_locked")
	             TCategory("cate_icon")="images/icons/1.gif"
	             TCategory("cate_count")=SCategory("cat_articleCount")
	             TCategory("cate_local")=0
	             TCategory("cate_Secret")=SCategory("cat_hidden")
	             TCategory.update
	             SCount=SCount+1
	             SCategory.movenext
	        loop
	             TCategory.addnew
			     TCategory("cate_Name")="日志首页"
			     TCategory("cate_Order")=-99
			     TCategory("cate_Intro")=""
			     TCategory("cate_OutLink")=true
			     TCategory("cate_URL")="default.asp"
			     TCategory("cate_Lock")=true
			     TCategory("cate_icon")="images/icons/22.gif"
			     TCategory("cate_count")=0
			     TCategory("cate_local")=0
			     TCategory("cate_Secret")=false
			     TCategory.update
				 TCategory.addnew
			     TCategory("cate_Name")="TAGS"
			     TCategory("cate_Order")=0
			     TCategory("cate_Intro")=""
			     TCategory("cate_OutLink")=true
			     TCategory("cate_URL")="tag.asp"
			     TCategory("cate_Lock")=false
			     TCategory("cate_icon")="images/icons/10.gif"
			     TCategory("cate_count")=0
			     TCategory("cate_local")=0
			     TCategory("cate_Secret")=false
			     TCategory.update
		    response.write "<li>已经复制了<b>"&SCount&"</b>条日志分类信息</li>"
		'--------------------开始复制通告信息-----------------------
		    dim TTrackback,STrackback
		    SCount=0
		    set STrackback=connS.execute ("select * from blog_Trackback")
            Set TTrackback=Server.CreateObject("ADODB.RecordSet")
            TTrackback.Open "select * from blog_Trackback",ConnT,1,2
	        do until STrackback.eof
	             TTrackback.addnew
	             TTrackback("tb_ID")=STrackback("tb_id")
	             TTrackback("blog_ID")=STrackback("log_id")
	             TTrackback("tb_URL")=STrackback("tb_url")
	             TTrackback("tb_Title")=STrackback("tb_title")
	             TTrackback("tb_Site")=STrackback("tb_blog")
	             TTrackback("tb_SiteURL")=STrackback("tb_url")
	             TTrackback("tb_Intro")=STrackback("tb_excerpt")
	             TTrackback("tb_PostTime")=STrackback("tb_time")
	             TTrackback.update
	             SCount=SCount+1
	             STrackback.movenext
	        loop
		    response.write "<li>已经复制了<b>"&SCount&"</b>条通告信息</li>"
		'--------------------开始复制用户信息-----------------------
		    dim TMember,SMember
		    SCount=0
		    set SMember=connS.execute ("select * from blog_User")
            Set TMember=Server.CreateObject("ADODB.RecordSet")
            TMember.Open "select * from blog_Member",ConnT,1,2
	        do until SMember.eof
	            TMember.addnew
	            TMember("mem_ID")=SMember("user_id")
	            TMember("mem_Name")=SMember("user_name")
	            TMember("mem_Password")=SMember("user_password")
	            TMember("mem_salt")=SMember("user_salt")
	            TMember("mem_Sex")=SMember("user_gender")
	            TMember("mem_Email")=SMember("user_email")
	            TMember("mem_HideEmail")=SMember("user_hideEmail")
	            TMember("mem_QQ")=""
	            TMember("mem_HomePage")=SMember("user_homepage")
	            TMember("mem_Local")=""
	            TMember("mem_RegTime")=now()
	            TMember("mem_RegIP")=""
	            if SMember("user_groupID")=1 then 
	               TMember("mem_Status")="SupAdmin"
	             else
	               TMember("mem_Status")="Member"
	            end if
	            TMember("mem_PostLogs")=SMember("user_articleCount")
	            TMember("mem_PostComms")=SMember("user_commentCount")
	            TMember("mem_PostMessageNums")=0
	            TMember("mem_Intro")=""
	            TMember("mem_lastVisit")=SMember("user_lastVisit")
	            TMember("mem_LastIP")=SMember("user_ip")
	            TMember("mem_hashKey")=SMember("user_hashKey")
	            TMember.update
	            SCount=SCount+1
	            SMember.movenext
	        loop
		    response.write "<li>已经复制了<b>"&SCount&"</b>条用户信息</li>"
			'--------------------开始复制UBB表情-----------------------
		    dim SUBB,TUBB
		    SCount=0
		    set SUBB=connS.execute ("select * from blog_Smilies")
            Set TUBB=Server.CreateObject("ADODB.RecordSet")
            TUBB.Open "select * from blog_Smilies",ConnT,1,2
	        do until SUBB.eof
	             TUBB.addnew
				 TUBB("sm_ID")=SUBB("sm_id")
				 TUBB("sm_Image")=SUBB("sm_image")
				 TUBB("sm_Text")=SUBB("sm_code")
	             TUBB.update
	             SCount=SCount+1
	             SUBB.movenext
	        loop
		    response.write "<li>已经复制了<b>"&SCount&"</b>条UBB表情</li>"
			'--------------------开始复制留言本信息-----------------------
			if len(SGbookPath)<>0 then
				dim TGbook,SGbook,connG
				SCount=0
				if not FSO.FileExists(Server.MapPath(SGbookPath)) then
			   	response.write "<li><span style=""color:#F00;font-weight:bold"">错误：留言本数据库不存在!</span></li>"
		   		else
					Set connG=Server.CreateObject("ADODB.Connection")
					connG.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(SGbookPath)
					connG.Open
					set SGbook=connG.execute ("select * from Guestbook")
					Set TGbook=Server.CreateObject("ADODB.RecordSet")
					TGbook.Open "select * from blog_book",ConnT,1,2
					do until SGbook.eof
						TGbook.addnew
						TGbook("book_ID")=SGbook("gb_id")
						TGbook("book_Messager")=SGbook("gb_username")
						TGbook("book_QQ")=""
						TGbook("book_Mail")=""
						TGbook("book_Url")=""
						TGbook("book_face")="face1"
						TGbook("book_IP")=SGbook("gb_ip")
						TGbook("book_Content")=SGbook("gb_content")
						TGbook("book_PostTime")=SGbook("gb_postTime")
						TGbook("book_reply")=SGbook("gb_reply")
						TGbook("book_HiddenReply")=SGbook("gb_hidden")
						TGbook("book_replyTime")=SGbook("gb_replyTime")
						TGbook("book_replyAuthor")=SGbook("gb_replyUsername")
						SCount=SCount+1
						TGbook.update
						SGbook.movenext
					loop
			  	 	response.write "<li>已经复制了<b>"&SCount&"</b>条留言本信息</li>"
		   			response.write "</ol></div>"
				end if
			else
				response.write "<li><span style=""color:#F55;font-weight:bold"">提示：留言本数据库未复制!</span></li>"
			end if
			set connS=nothing
			set connT=nothing
 end if
   %>
 </div>
</body>
</html>

<%
Function SplitLines(byVal Content,byVal ContentNums) '切割内容
	Dim ts,i,l
	ContentNums=int(ContentNums)
	If IsNull(Content) Then Exit Function
	i=1
	ts = 0
	For i=1 to Len(Content)
      l=Lcase(Mid(Content,i,5))
      	If l="<br/>" Then
         	ts=ts+1
      	End If
      l=Lcase(Mid(Content,i,4))
      	If l="<br>" Then
         	ts=ts+1
      	End If
      l=Lcase(Mid(Content,i,3))
      	If l="<p>" Then
         	ts=ts+1
      	End If
	If ts>ContentNums Then Exit For 
	Next
	If ts>ContentNums Then
    	Content=Left(Content,i-1)
	End If
	SplitLines=Content
End Function

function closeUBB(strContent)
  dim arrTags,i,OpenPos,ClosePos,re,strMatchs,j,Match
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
    arrTags=array("code","quote","list","color","align","font","size","b","i","u","html")
  for i=0 to ubound(arrTags)
   OpenPos=0
   ClosePos=0
   
   re.Pattern="\["+arrTags(i)+"(=[^\[\]]+|)\]"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    OpenPos=OpenPos+1
   next
   re.Pattern="\[/"+arrTags(i)+"\]"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    ClosePos=ClosePos+1
   next
   for j=1 to OpenPos-ClosePos
      strContent=strContent+"[/"+arrTags(i)+"]"
   next
  next
closeUBB=strContent
end function

function closeHTML(strContent)
  dim arrTags,i,OpenPos,ClosePos,re,strMatchs,j,Match
	Set re=new RegExp
	re.IgnoreCase =True
	re.Global=True
    arrTags=array("p","div","span","table","ul","font","b","u","i","h1","h2","h3","h4","h5","h6")
  for i=0 to ubound(arrTags)
   OpenPos=0
   ClosePos=0
   
   re.Pattern="\<"+arrTags(i)+"( [^\<\>]+|)\>"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    OpenPos=OpenPos+1
   next
   re.Pattern="\</"+arrTags(i)+"\>"
   Set strMatchs=re.Execute(strContent)
   For Each Match in strMatchs
    ClosePos=ClosePos+1
   next
   for j=1 to OpenPos-ClosePos
      strContent=strContent+"</"+arrTags(i)+">"
   next
  next
closeHTML=strContent
end function


Function HTMLEncode(reString) '转换HTML代码
	Dim Str:Str=reString
	If Not IsNull(Str) Then
   		Str = Replace(Str, ">", "&gt;")
		Str = Replace(Str, "<", "&lt;")
	    Str = Replace(Str, CHR(9), "&nbsp;")
	    Str = Replace(Str, CHR(39), "&#39;")
    	Str = Replace(Str, CHR(34), "&quot;")
		Str = Replace(Str, CHR(13), "")
		Str = Replace(Str, CHR(10), "<br/>")
		HTMLEncode = Str
	End If
End Function

%>
