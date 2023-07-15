<%@ page language="java" import="java.util.*" import="javax.swing.JOptionPane"  import="bean.MyBean" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%String username=(String)request.getAttribute("username");
  String goodsname=(String)request.getAttribute("goodsname");
  String subtype=(String)request.getAttribute("subtype");
  %>
<%ArrayList<MyBean> list=(ArrayList<MyBean>)request.getAttribute("se");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <style type="text/css">
<!--
body {
	background-color: #FFC0CB;
}
.STYLE1 {color: #990033}
body,td,th {
	font-family: 宋体;
	color: #990033;
}
-->
</style>
<style type="text/css">
<!--
body {
	background-color: #CCCCCC;
}
.STYLE2 {
	color: #0033CC;
	white-space: normal;
}
-->
</style>
<style type="text/css">
<!--
.STYLE3 {
	font-family: "新宋体";
	color: #990033;
}
body {
	background-color: #FFC0CB;
}
-->
</style>
    <base href="<%=basePath%>">
    
<title>搜索结果页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="dwr/engine.js"></script>     
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/dos.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
  <body >
  <span class="STYLE1">
  <a href="login.jsp" >登录</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="myloginw.action?&username=<%=username %>&isFirst=false" >搜索</a><br><hr><br>
  
  <input type="button"  title="同一类别 " value="综合" onclick="javascript:window.location.href='se.action?t=1&name=<%=username%>&subtype=<%=subtype%>&goods=<%=goodsname%>'"/>
  <input type="button"    title="按价格由低到高 " value="价格"  onclick="javascript:window.location.href='se.action?t=2&name=<%=username%>&subtype=<%=subtype%>&goods=<%=goodsname%>'"/>
  <input type="button"   title="精确 " value="评价"  onclick="javascript:window.location.href='se.action?t=3&name=<%=username%>&subtype=<%=subtype%>&goods=<%=goodsname%>'"/>
  <input type="button"  title="精确 " value="点击率"  onclick="javascript:window.location.href='se.action?t=4&name=<%=username%>&subtype=<%=subtype%>&goods=<%=goodsname%>'"/>
  </span><br><br>
  <div style="color:#990099;background-color:#FAEBD7">
   <center><br><br>
   <table border="1">
  <% for(int i=0;i<list.size();i++){
  int id=list.get(i).getId();
 // System.out.println(username);
 if(i%10==0)
 {
 out.println("<tr>");
 }
  %>  
 
<td width="50" bgcolor="#FFFFFF">
           <a href="<%=list.get(i).geturl()%>" target="view_window" onclick="dos.addhit(<%=id%>);dos.addrecord('<%=id%>','<%=username%>');"  >     
           <img src="<%=list.get(i).getpic()%>" width="50" height="50"/>   </a>
       <%= list.get(i).getPrice()%><br>
           </td>
 <%
 }%>
 </table></center>
 <input type="hidden" id="hiddenusername" value="<%=username %>" />
 </div>
 <h4 align="center" class="STYLE3">想你所想网</h4>
  </body>
</html>
