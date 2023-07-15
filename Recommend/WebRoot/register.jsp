<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = request.getParameter("username");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Welcome</title>
  <script type="text/javascript" src="dwr/engine.js"></script>     
	<script type="text/javascript" src="dwr/util.js"></script>
    <script type="text/javascript" src="dwr/interface/reg.js"></script>
 <script > 
 function check()
 {
 var name=document.getElementById("username").value;
  var password=document.getElementById("password").value;
   var passwordcheck=document.getElementById("passwordcheck").value;
   var email=document.getElementById("email").value;
   var patrn=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
   if(name=="")
   {
   document.getElementById("tips").innerHTML="用户名不能为空!";
   }
   else if(password=="")
   {
   document.getElementById("tips").innerHTML="密码不能为空!";
   }
   else if(password!=passwordcheck)
   {
   document.getElementById("tips").innerHTML="密码不一致!";
   }
   else if(!patrn.test(email))
   {
   document.getElementById("tips").innerHTML="email格式不正确!";
   }
   else
   {
   reg.findauser(name,email,na);
   }
 }
 function na(str)
 {
 if(str=="ok")
 document.getElementById("tips").innerHTML="可以注册!";
 else if(str=="existuser")
 {
 document.getElementById("tips").innerHTML="用户已存在!";
 }
 else
 {
 document.getElementById("tips").innerHTML="email已存在!";
 }
 }
 function register()
 {
  var str=document.getElementById("tips").innerHTML;
  var name=document.getElementById("username").value;
  var password=document.getElementById("password").value;
  var passwordcheck=document.getElementById("passwordcheck").value;
  var email=document.getElementById("email").value;
  if(str=="可以注册!")
 {
 window.location.href="re.action?&username="+name+"&password="+password+"&passwordcheck="+passwordcheck+"&email="+email;
 }
 else
 {
 alert("好好检查一下!");
 }
 }
 </script>
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
body {
	background-color: #FFC0CB;
}
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>
<body onLoad="check();">
 <center><h2>用户注册</h2>
  
 
  <form   >
    <p>
        用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名
        <input type="text"   onFocus="this.select()"  value="<%=username %>"  name="username" id="username" onKeyUp="check();" maxlength=25 class="d"/>
    </p>
    <p>
      密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码
        <input type="password"   onFocus="this.select()"  value="" name="password" id="password" onKeyup="check();" maxlength=25 class="a"/>
    </p>
    <p>
      确认密码
        <input type="password"   onFocus="this.select()"  value="" name="passwordcheck" id="passwordcheck" onKeyup="check();" maxlength=25 class="b"/>
    </p>
    <p>
      邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱
        <input type="text"  onFocus="this.select()"   name="email" id="email" onKeyup="check();" maxlength=25 class="c"/>
    </p>
    <div class="hover-opacity" >
      <label  id="tips" ></label>
    </div>
    <input type="button" name="reg_button" value="注册" id="reg_button" onClick="register();"/>
  </form>
</center>
</body>

</html>
