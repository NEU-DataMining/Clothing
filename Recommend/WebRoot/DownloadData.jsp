<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>服装数据下载</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {
		
			background-color: #FFFACD;
		}
		#outline{
		position: absolute;width:1000px;height:200px;top:50%; margin-top:-100px;left:10% 
		}
		.btn{
	color: #FFFFFF;
	display: inline-block;
	padding: 5px 10px 6px;
	background-color: #c81e82;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: absolute;
	cursor: pointer
		}
	</style>

  </head>
  
  <body>
  <center>
  <div id="outline">
  <h3>
  	<label>请输入店铺所有商品页的URL：</label>
  	<textarea rows="1" cols="100"></textarea>
  	<div>
  	<button class="btn">开始下载</button>
  	</div>
  	</h3>
  	</div>
  	
  	</center>
  </body>
</html>
