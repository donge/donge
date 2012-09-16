<%
function htmlencode(str)
    dim result
    dim l
    if isNULL(str) then 
       htmlencode=""
       exit function
    end if
    l=len(str)
    result=""
	dim i
	for i = 1 to l
	    select case mid(str,i,1)
              case chr(13)
	                result=result+"<br>"
	           case chr(34)
	                result=result+"&quot;"
              case chr(32)	           
	                'result=result+"&nbsp;"
	                if i+1<=l and i-1>0 then
	                   if mid(str,i+1,1)=chr(32) or mid(str,i+1,1)=chr(9) or mid(str,i-1,1)=chr(32) or mid(str,i-1,1)=chr(9)  then	                      
	                      result=result+"&nbsp;"
	                   else
	                      result=result+" "
	                   end if
	                else
	                   result=result+"&nbsp;"	                    
	                end if
	           case chr(9)
	                result=result+"    "
	           case else
	                result=result+mid(str,i,1)
         end select
       next 
       htmlencode=result
end function

function HTMLEncode2(fString)
	fString = Replace(fString,  "&lt;","<")
	fString = Replace(fString,  "</P><P>",CHR(10) & CHR(10))
	fString = Replace(fString,  "&gt;",">")
	fString = Replace(fString,  "<br>",CHR(13))
	fString = Replace(fString,  "&quot;",CHR(34))
	fString = Replace(fString,  "&amp;","&")
	fString = Replace(fString,  "&nbsp;",CHR(32))
	HTMLEncode2 = fString
end function

%>


