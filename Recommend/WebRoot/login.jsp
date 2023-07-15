<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>登录</title>

  <script type="text/javascript" src="dwr/engine.js"></script>     
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/checkname.js"></script>
	<script>
	function check()
	{
	var name=document.getElementById("username").value;
	var code=document.getElementById("password").value;
	var is=document.getElementById("first");
	var admin="false";
	if(is.checked)
	{
	alert("欢迎注册!");
	is="true";
	window.location.href="myloginw.action?&username="+name+"&password="+code+"&isFirst="+is+"&isAdmin="+admin;
	}
	else
	checkname.findthisuser(name,code,tips);
	}
	
	function tips(str)
	{
	var name=document.getElementById("username").value;
	var code=document.getElementById("password").value;
	var is="false";
	var admin="false";
	alert(str);
	if(str=="管理员登录成功!"){
		admin="true";
		window.location.href="myloginw.action?&username="+name+"&password="+code+"&isFirst="+is+"&isAdmin="+admin;
	}
	if(str=="用户登录成功!")
	window.location.href="myloginw.action?&username="+name+"&password="+code+"&isFirst="+is+"&isAdmin="+admin;
	}
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<style type="text/css">
	<!--
body {
	background-color: #FFC0CB;
}
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>
<% 
String ie=request.getHeader("User-Agent"); 
 if(ie.indexOf("MSIE")==-1)
{
%>
<body >
<br><br><br><br><br>
<center>
<strong><big>对不起，本系统不支持IE以外的浏览器!
</big></strong></center>

</body>
<% 
}
else
{
%> 
<body>

<center>
  <h1 class="STYLE1" >想你所想网</h1>
  </center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" height="20">
  <tr>
    <td width="60%" ><center><img src="./images/l.jpg" style="height: 273px; width: 302px; "></center></td>
    <td width="40%" ><center>
  <form >
    <p>
     用户名： <input type="text"  onclick="this.value='';" onFocus="this.select()"  value="sdd"  id="username" name="username" maxlength=15/>
    </p>
     <p>
     密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password"  onclick="this.value='';" onFocus="this.select()"  value="123" id="password" name="password" maxlength=15/>
    </p>
    <input type="button"  name="log_button" value="登录" id="log_button" onClick="check();"/>
    <input type="checkbox" name="isFirst" id="first" />
    <span class="hover-opacity">
    <label for="remember">注册?</label>
</span>
 </form>
   </td></center>
  </tr>
</table>
<hr></hr>
        相关网站：
        <a href="http://www.taobao.com/?id=shouye_taobao">淘宝网</a>
        <b>|</b>
        <a href="http://www.tmall.com/">天猫</a>
        <b>|</b>
        <a href="http://ju.taobao.com/">聚划算</a>
        <b>|</b>
<hr></hr>
</body>
 <%
}
%> 
</html>
