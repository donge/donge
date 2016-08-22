<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许
require("global.php");
require("header.php");
require_once("blog/language/$blogadminlang/admincp.lang.php"); //引入语言包

if (!eregi("Bo-blog", $versioninfo)) {
	@rename ("blog/mblogcon.php", "blog/".time().time());
	die ("不正确的版权信息，程序拒绝执行！<br/>Sorry, copyright check failed!");
}


if ($login_status==0) {
	die ("<font face=\"Verdana\"><br><BR><BR><BR>You MUST Login to View the Admin Column."); 
}

@header("Content-Type: text/html; charset=utf-8");

print <<< eot
<head>
<base target="frmright"> 
</head>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
<tr> 
<td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
<tr><td height="8" bgcolor="#E9F2FC">Language Setting</td>
</tr><tr><td height="9" bgcolor="#FFFFFF">
<li><A HREF="admin_cp.php?job=config&action=setlang">Default Language</A></li>
<li><A HREF="admin_cp.php?job=config&action=adminlang">$langacp[37]</A></li></td></tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
<tr> 
<td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
<tr><td height="8" bgcolor="#E9F2FC">$langacp[0]</td>
</tr><tr><td height="9" bgcolor="#FFFFFF">
<li><A HREF="admin_cp.php">$langacp[1]</A></li></td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[2]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=config">$langacp[3]</A></li>
  <li><A HREF="admin_cp.php?job=offtime">$langacp[40]</A></li>
  <li><A HREF="admin_cp.php?job=change&action=modreg">$langacp[4]</A></li>
  <li><A HREF="admin_cp.php?job=modprofile">$langacp[5]</A></li>
  <li><A HREF="admin_cp.php?job=change&action=chpath">$langacp[6]</A></li>
  <li><A HREF="admin_cp.php?job=frameset">$langacp[39]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[7]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=config&action=admintem">$langacp[8]</A></li>
  <li><A HREF="admin_cp.php?job=change&action=modlink">$langacp[9]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>

<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[10]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=useradmin">$langacp[11]</A></li>
  <li><A HREF="admin_cp.php?job=usergroup">$langacp[46]</A></li>
  <li><A HREF="admin_cp.php?job=batch">$langacp[41]</A></li>
  <li><A HREF="admin_cp.php?job=admindrafts">$langacp[42]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>

<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[12]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=cat&action=readynew">$langacp[13]</A></li>
  <li><A HREF="admin_cp.php?job=cat&action=modcat">$langacp[14]</A></li>
   <li><A HREF="admin_cp.php?job=cat&action=sort">$langacp[15]</A></li>
 <li><A HREF="admin_cp.php?job=cat&action=readydel">$langacp[16]</A></li>
 <li><A HREF="admin_cp.php?job=cat&action=redirect">$langacp[38]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>

<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[17]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
<li><A HREF="admin_cp.php?job=ban">$langacp[18]</A></li>
<li><A HREF="admin_cp.php?job=announce">$langacp[19]</A></li>
<li><A HREF="admin_cp.php?job=wordreplacer">$langacp[20]</A></li>
<li><A HREF="admin_cp.php?job=upload&action=adminups">$langacp[21]</A></li>
<li><A HREF="admin_cp.php?job=change&action=chtimezone">$langacp[22]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[23]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
<li><A HREF="admin_cp.php?job=galleryadmin">$langacp[24]</A></li>
<li><A HREF="admin_cp.php?job=galleryadmin&action=thumbs">$langacp[25]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[26]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=maintain&action=readymain">$langacp[27]</A></li>
  <li><A HREF="admin_cp.php?job=maintain&action=readycache">$langacp[28]</A></li>
  <li><A HREF="admin_cp.php?job=maintain&action=checkenv">$langacp[29]</A></li>
  <li><A HREF="admin_cp.php?job=back&action=back">$langacp[31]</A></li>
  <li><A HREF="admin_cp.php?job=back&action=reback">$langacp[32]</A></li>
  <li><A HREF="admin_cp.php?job=maintain&action=recacheemots">$langacp[45]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[43]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=plugin">$langacp[44]</A></li>
eot;
if (file_exists("plugin/admins.php")) include ("plugin/admins.php"); 
print <<< eot
</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table width="160" border="0" cellpadding="0" cellspacing="0" bgcolor="#004080">
  <tr> 
    <td height="20"><table width="100%" border="0" cellspacing="1" cellpadding="4">
        <tr> 
          <td height="8" bgcolor="#E9F2FC">$langacp[33]</td>
        </tr>
        <tr> 
          <td height="9" bgcolor="#FFFFFF">
  <li><A HREF="admin_cp.php?job=change&action=runphp">$langacp[34]</A></li>
  <li><A HREF="login.php?action=logout">$langacp[35]</A></li>
  <li><A HREF="index.php" target=_parent>$langacp[36]</A></li>
</td>
        </tr>
      </table></td>
  </tr>
</table>
eot;
?>