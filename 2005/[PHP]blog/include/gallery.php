<?php
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
checkpermit ('ViewGallery');
require_once("blog/language/$bloglang/gbook.lang.php"); //引入语言包
require_once("include/gallery_func.php"); //引入语言包

if (empty($gal_perrow)) $gal_perrow=4;
if (empty($gal_picperrow)) $gal_picperrow=3;
if (empty($gal_picperpage)) $gal_picperpage=6;

$dirgal='gallery';
$gal_template="blog/template/$tem/gallery.htm";
$thumb_affix="_thb_";
$cognitive_pic=array ('.jpg', '.gif', '.jpe', '.jpeg', '.bmp', '.png', '.wmf', '.psd');
$no_thumb="blog/template/$tem/thumb.gif";

if (!$a) {
	if (!$pid) $a='general';
	else $a='p';
}

if (!$page) $page=1;

$gaa=getstr($owner, $langgal[0]);

if ($a=='general') {
	$gal_total=roam_gal ($dirgal);
	if ($gal_total!=0) {
		$t -> set_file("galbody", $gal_template);
		$t -> set_block("galbody", "eachgal");
		for ($i=0; $i<$gal_total; $i++) {
			$t -> set_var(array('name'=>$gal_name[$i], 'dir'=>$gal_dirname[$i], 'description'=>$gal_desc[$i],));
			$gal_parts[]=$t->subst ("eachgal");
		}
		$gapfiller=$gal_perrow-$gal_total%$gal_perrow+$gal_total;
		$gal_parts=array_pad ($gal_parts, $gapfiller, '&nbsp;'); 
		$gal_output=table_generate ($gal_parts, $gal_perrow, $gapfiller);
		$t -> set_block("galbody", "maingal");
		$t -> set_var(array('galleryname'=>$gaa, 'gallerymain'=>$gal_output,));
		$noall=$t->subst ("maingal");
		$t->set_var(array("mainbodyout"=>$noall));
	}
}

if ($a=='f') {
	$oldfid=$fid;
	$fid=basename($fid);
	if (empty($fid) || !is_dir($dirgal.'/'.$fid)) {
		return;
	}

	$pic_total=roam_folder ($dirgal.'/'.$fid);
	$starts=($page-1)*$gal_picperpage;
	if (($starts+$gal_picperpage-1)<$pic_total) $ends=$starts+$gal_picperpage;
	else $ends=$pic_total;
	$lastpage=floor(($pic_total-1)/$gal_picperpage)+1;
	$pagebar="$langgal[5] {$page}/{$lastpage} ";
	for ($i=1; $i<=$lastpage; $i++) {
		$pagebar.=" <a href='index.php?job=gallery&amp;a=f&amp;fid=$oldfid&amp;page=$i'>[$i]</a>";
	}

	if ($pic_total!=0) {
		$t -> set_file("galbody", $gal_template);
		$t -> set_block("galbody", "eachpic");
		for ($i=$starts; $i<$ends; $i++) {
			$t -> set_var(array('pic_name'=>$pic_name[$i], 'img'=>$pic_thumb[$i], 'pic_des'=>$pic_des[$i], 'url'=>$pic_name_encoded[$i],));
			$gal_parts[]=$t->subst ("eachpic");
		}
		$gapfiller=$gal_picperrow-$gal_picperpage%$gal_picperrow+($ends-$starts)-1;
		$gal_parts=array_pad ($gal_parts, $gapfiller, '&nbsp;'); 
		$gal_output=table_generate ($gal_parts, $gal_picperrow, $gapfiller);
		$gal_output.="<br/><div align='right'>$pagebar</div>";
		$t -> set_block("galbody", "viewbar");
		@include ($dirgal.'/'.$fid.'/gallery_nfo.php');
		$t -> set_var(array('galname'=>stripslashes($gallery_name), 'gal_des'=>stripslashes($gallery_description), 'fid'=>$fid, 'langup'=>$langgal[3], 'langslide'=>$langgal[4],));
		$noall=$t->subst ("viewbar");

		$t -> set_block("galbody", "maingal");
		$t -> set_var(array('galleryname'=>$gaa, 'gallerymain'=>$noall.$gal_output,));
		$noall=$t->subst ("maingal");
		$t->set_var(array("mainbodyout"=>$noall));
	}
}

if ($a=='p') {
checkpermit ('ViewPic');

	if (empty($pid)) {
		return;
	}
	$trueurl=base64_decode($pid);
	if (file_exists($trueurl) && identify_format(strrchr($trueurl,'.'))){
		$connections=get_context($trueurl);
		if ($connections[0]=="") $previousone="";
		else {
			$connections[0]=base64_encode($connections[2].$connections[0]);
			$previousone="<a href=\"index.php?job=gallery&amp;pid={$connections[0]}\"><img src=\"img/arleft.gif\" border=\"0\" alt=\"Previous\" /> $langgal[1]</a>";
		}
		if ($connections[1]=="") $nextone="";
		else {
			$connections[1]=base64_encode($connections[2].$connections[1]);
			$nextone="<a href=\"index.php?job=gallery&amp;pid={$connections[1]}\">$langgal[2] <img src=\"img/arright.gif\" border=\"0\" alt=\"Next\" /></a>";
		}
		$fid=str_replace('/','', str_replace($dirgal,'',$connections[2]));
		$fileid=str_replace('/','', strrchr($trueurl,'/'));

		$return="<a href=\"index.php?job=gallery&amp;a=f&amp;fid={$fid}\"><img src=\"img/arup.gif\" border=\"0\" alt=\"Previous\" /> $langgal[3]</a>";

		$pic_des=pic_des($fileid, get_des ($dirgal.'/'.$fid));
		$pic_des=decode($pic_des, 'full');

		$t -> set_file("galbody", $gal_template);
		$t -> set_block("galbody", "seepic");
		$t -> set_var(array('trueurl'=>$trueurl, 'pic_des'=>$pic_des, 'previousone'=>$previousone,'nextone'=>$nextone,'return'=>$return,));
		$noalls=$t->subst ("seepic");
		$t -> set_block("galbody", "maingal");
		$t -> set_var(array('galleryname'=>$gaa, 'gallerymain'=>$noalls, ));
		$noall=$t->subst("maingal");
		$t->set_var(array("mainbodyout"=>$noall));
	}
	
}

if ($a=='s') {
checkpermit ('ViewPic');
	if (empty($fid)) {
		return;
	}
	$fidreal=pathinfo ($fid);
	if (!is_dir($dirgal.'/'.$fidreal['dirname'])) return;

	$pic_total=roam_folder ($dirgal.'/'.$fid);
	$all_pic_name=implode("\" , \"$dirgal/$fid/", $pic_name);
	$all_pic_name="\"$dirgal/$fid/".$all_pic_name;
	$all_pic_name.="\"";
	$first_pic_name="$dirgal/$fid/$pic_name[0]";
	$fixedwidth=500;

$MMSlde=<<< eot
<script language="JavaScript">
<!--
function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}


function MM_timelineGoto(tmLnName, fNew, numGotos) { //v2.0
  //Copyright 1997 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,lastKeyFr,propNum,theObj;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (numGotos != null)
    if (tmLn.gotoCount == null) tmLn.gotoCount = 1;
    else if (tmLn.gotoCount++ >= numGotos) {tmLn.gotoCount=0; return}
  jmpFwd = (fNew > tmLn.curFrame);
  for (i = 0; i < tmLn.length; i++) {
    sprite = (jmpFwd)? tmLn[i] : tmLn[(tmLn.length-1)-i]; //count bkwds if jumping back
    if (sprite.charAt(0) == "s") {
      numKeyFr = sprite.keyFrames.length;
      firstKeyFr = sprite.keyFrames[0];
      lastKeyFr = sprite.keyFrames[numKeyFr - 1];
      if ((jmpFwd && fNew<firstKeyFr) || (!jmpFwd && lastKeyFr<fNew)) continue; //skip if untouchd
      for (keyFrm=1; keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]; keyFrm++);
      for (j=0; j<sprite.values.length; j++) {
        props = sprite.values[j];
        if (numKeyFr == props.length) propNum = keyFrm-1 //keyframes only
        else propNum = Math.min(Math.max(0,fNew-firstKeyFr),props.length-1); //or keep in legal range
        if (sprite.obj != null) {
          if (props.prop2 == null) sprite.obj[props.prop] = props[propNum];
          else        sprite.obj[props.prop2][props.prop] = props[propNum];
      } }
    } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
  }
  tmLn.curFrame = fNew;
  if (tmLn.ID == 0) eval('MM_timelinePlay(tmLnName)');
}

function MM_timelinePlay(tmLnName, myID) { //v1.2
  //Copyright 1997 Macromedia, Inc. All rights reserved.
  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,propNum,theObj,firstTime=false;
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  tmLn = document.MM_Time[tmLnName];
  if (myID == null) { myID = ++tmLn.ID; firstTime=true;}//if new call, incr ID
  if (myID == tmLn.ID) { //if Im newest
    setTimeout('MM_timelinePlay("'+tmLnName+'",'+myID+')',tmLn.delay);
    fNew = ++tmLn.curFrame;
    for (i=0; i<tmLn.length; i++) {
      sprite = tmLn[i];
      if (sprite.charAt(0) == 's') {
        if (sprite.obj) {
          numKeyFr = sprite.keyFrames.length; firstKeyFr = sprite.keyFrames[0];
          if (fNew >= firstKeyFr && fNew <= sprite.keyFrames[numKeyFr-1]) {//in range
            keyFrm=1;
            for (j=0; j<sprite.values.length; j++) {
              props = sprite.values[j]; 
              if (numKeyFr != props.length) {
                if (props.prop2 == null) sprite.obj[props.prop] = props[fNew-firstKeyFr];
                else        sprite.obj[props.prop2][props.prop] = props[fNew-firstKeyFr];
              } else {
                while (keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]) keyFrm++;
                if (firstTime || fNew==sprite.keyFrames[keyFrm-1]) {
                  if (props.prop2 == null) sprite.obj[props.prop] = props[keyFrm-1];
                  else        sprite.obj[props.prop2][props.prop] = props[keyFrm-1];
        } } } } }
      } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);
      if (fNew > tmLn.lastFrame) tmLn.ID = 0;
  } }
}

function MM_timelineStop(tmLnName) { //v1.2
  //Copyright 1997 Macromedia, Inc. All rights reserved.
  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time
  if (tmLnName == null)  //stop all
    for (var i=0; i<document.MM_Time.length; i++) document.MM_Time[i].ID = null;
  else document.MM_Time[tmLnName].ID = null; //stop one
}

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}

function MM_initTimelines() {
    //MM_initTimelines() Copyright 1997 Macromedia, Inc. All rights reserved.
    var ns = navigator.appName == "Netscape";
    document.MM_Time = new Array(1);
    document.MM_Time[0] = new Array(2);
    document.MM_Time["Timeline_main"] = document.MM_Time[0];
    document.MM_Time[0].MM_Name = "Timeline_main";
    document.MM_Time[0].fps = 1;
    document.MM_Time[0][0] = new String("sprite");
    document.MM_Time[0][0].slot = 1;
    if (ns)
        document.MM_Time[0][0].obj = document["Layer1"] ? document["Layer1"].document["Layer5"].document["Image1"] : document["Layer5"].document["Image1"];
    else
        document.MM_Time[0][0].obj = document["Image1"];
    document.MM_Time[0][0].keyFrames = new Array(1, 4, 7, 10, 13, 16, 19);
    document.MM_Time[0][0].values = new Array(1);
    document.MM_Time[0][0].values[0] = new Array($all_pic_name);
    document.MM_Time[0][0].values[0].prop = "src";
    document.MM_Time[0][1] = new String("behavior");
    document.MM_Time[0][1].frame = $pic_total;
    document.MM_Time[0][1].value = "MM_timelineGoto('Timeline_main','1')";
    document.MM_Time[0].lastFrame = $pic_total;
    for (i=0; i<document.MM_Time.length; i++) {
        document.MM_Time[i].ID = null;
        document.MM_Time[i].curFrame = 0;
        document.MM_Time[i].delay = 3000/document.MM_Time[i].fps;
    }
}
//-->
</script>
<body onload="MM_timelinePlay('Timeline_main')">
<div align="center" id="Layer1"><a href="javascript:" onClick="MM_timelinePlay('Timeline_main')"><img src="img/splay.gif" border="0" alt="$langgal[6]"/></a> <a href="javascript:"  onClick="MM_timelineStop('Timeline_main')"><img src="img/sstop.gif" border="0" alt="$langgal[7]"/></a> <a href="javascript:" onClick="MM_timelineGoto('Timeline_main','1');MM_timelinePlay('Timeline_main')"><img src="img/sreplay.gif" border="0" alt="$langgal[8]"/></a> [{$langgal[9]}]<br/>
  <div id="Layer5" style="position:relative; left:1px; top:1px; z-index:1; overflow-x: hidden; width: $fixedwidth"><img src="$first_pic_name" name="Image1"></div></div>
eot;

	$t -> set_file("galbody", $gal_template);
	$t -> set_block("galbody", "viewbar");
	@include ($dirgal.'/'.$fid.'/gallery_nfo.php');
	$t -> set_var(array('galname'=>stripslashes($gallery_name), 'gal_des'=>stripslashes($gallery_description), 'fid'=>$fid, 'langup'=>$langgal[3], 'langslide'=>$langgal[4],));
	$noall=$t->subst ("viewbar");
	$t -> set_block("galbody", "maingal");
	$t -> set_var(array('galleryname'=>$gaa, 'gallerymain'=>$noall.$MMSlde,));
	$noall=$t->subst("maingal");
	$t->set_var(array("mainbodyout"=>$noall));

}