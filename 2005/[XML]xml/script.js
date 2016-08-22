


function k_loadXml ( dataFileName )
{
	var xmlDoc = new ActiveXObject("microsoft.xmldom");
	xmlDoc.async = false;
	var loadState = xmlDoc.load( dataFileName );
	if ( loadState && xmlDoc.xml != "")
	{
		return xmlDoc;
	}
	else
	{
		return null;
	}
}

function loadChapter()
{
	
	var chapter = k_loadXml( g_defaultChapterFile );
	var chapters = new Array;
	var chapterData = chapter.selectNodes( "//book/catalog/item");
	
	for ( i = 0 ; i < chapterData.length ; i ++ )
	{
		
		chapters[i] = chapterData.item(i).selectNodes("text").item(0).text;	
		chapters[i] += "|";
		chapters[i] += chapterData.item(i).selectNodes("links").item(0).text;	
	}
	
	var url = location.href;
	//alert ( location.href );
	
   
   
	var reg 		= new RegExp( "(.*)/(.*).xml" , "ig" );
	var re 			= reg.exec( url );
	var chapterId 	= RegExp.$2;
	
	//alert ( chapterId );

	
	
	var link_prevPage = false;
	var link_nextPage = false;
	

	for ( i in chapters )
	{
		if ( chapters[i].split("|")[1] == chapterId )
		{
			if ( i !=0 )
			{
				link_prevPage = chapters[i-1].split("|")[1] + ".xml";					
			}
			
			if ( i != chapters.length-1 )
			{
				link_nextPage = chapters[i*1+1].split("|")[1] + ".xml";	
			}
		break;
		}	
		
	}
	
	//alert ( link_prevPage + " " +  link_nextPage );
	
	var re_linkPrevPage				= /%link_prevPage%/g;
	var re_stringPrevPage			= /%string_prevPage%/g;
	var re_titlePrevPage			= /%title_prevPage%/g;
	
	var re_linkNextPage				= /%link_nextPage%/g;
	var re_stringNextPage			= /%string_nextPage%/g;
	var re_titleNextPage			= /%title_nextPage%/g;
	
	var outPutString_pervPage		= "��ҳ";
	var outPutString_nextPage		= "βҳ";
	
	if ( link_prevPage )
	{
		outPutString_pervPage = g_template['link_prevPage'];
	
		outPutString_pervPage = outPutString_pervPage.replace( re_linkPrevPage , link_prevPage );
		outPutString_pervPage = outPutString_pervPage.replace( re_stringPrevPage , g_string['prevPage'] );
		outPutString_pervPage = outPutString_pervPage.replace( re_titlePrevPage , chapters[i-1].split("|")[0] );
	}
	
	if ( link_nextPage )
	{
		outPutString_nextPage = g_template['link_nextPage'];
	
		outPutString_nextPage = outPutString_nextPage.replace( re_linkNextPage , link_nextPage );
		outPutString_nextPage = outPutString_nextPage.replace( re_stringNextPage , g_string['nextPage'] );
		outPutString_nextPage = outPutString_nextPage.replace( re_titleNextPage ,chapters[i*1+1].split("|")[0] );
	}
	
	//document.getElementById( "link_prevPage" ).innerHTML = outPutString_pervPage ;
	//document.getElementById( "link_nextPage" ).innerHTML = outPutString_nextPage ;
	document.writeln("<a href=\"index.xml\" target=\"_self\" title=\"��վ��ҳ\">Ŀ  ¼</a>");
	document.writeln(outPutString_pervPage);
	document.writeln(outPutString_nextPage);

	
	
}

var g_template = new Array;
	g_template['link_prevPage'] = "<a href=\"%link_prevPage%\" target=\"_self\" title=\"%title_prevPage%\">%string_prevPage%</a>";
	g_template['link_nextPage'] = "<a href=\"%link_nextPage%\" target=\"_self\" title=\"%title_nextPage%\">%string_nextPage%</a>";

var g_string =new Array;
	g_string['prevPage']		= "��һҳ";
	g_string['nextPage']		= "��һҳ";
	

var g_defaultChapterFile 		= "./index.xml";


loadChapter();