<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username=(String)request.getParameter("username");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <script type="text/javascript" src="dwr/engine.js"></script>     
<script type="text/javascript" src="dwr/util.js"></script>
 <script type="text/javascript" src="dwr/interface/out.js"></script>
 <script type="text/javascript" src="jquery-1.11.3.min.js"></script>
    <title>搜索</title>
<style type="text/css">
	#recommend
	{
	width:300px;
	height:58px;
	line-height:18px;
	font-size:18px;
	color:#fff;	
	background:url("images/bg36.jpg") no-repeat;	
	background-size:100% 200%;
	padding-bottom:4px;
	}
</style>
<script language="javascript">
/*
$(document).ready( function(){
alert("ggg");
	
	
});
*/

	function se(){//搜索函数
	var supertype=document.getElementById("leibie").value;
	var subtype=document.getElementById("fenlei").value;
	var goodsname=document.getElementById("goodsname").value;
	
	var usernnn='<%=username%>';
	//alert(usernnn);
	if (usernnn=="null")
	  alert("请先登录！"); 
	else {
         if(subtype=="")
            alert("没有选中要搜索的分类！");
       else
        {
            //alert(subtype);
            //alert(usernnn);
            window.location.href="se.action?t=0&name="+usernnn+"&sub="+subtype+"&goods="+goodsname;
           }
           }
	}   
var arr2 = new Array(4);
arr2["综合搜索"] = new Array("全体分类");
arr2["女式上衣"] = new Array("女士衬衫","女式T恤","女式针织衫","雪纺衫");
arr2["女式外套"] = new Array("女式大衣");
arr2["女式裤装"] = new Array("女士长裤","女式短裤");
arr2["女式裙装"] = new Array("女式连衣裙","女式短裙");
arr2["男士上衣"] = new Array("T恤","衬衫","针织衫");
arr2["男士外套"] = new Array("大衣","羽绒服");
arr2["男士裤装"] = new Array("裤子");
function removeinfo(classMenu){//将下拉框各选项清空
  for (var i=0; i < classMenu.options.length; i++){
    classMenu.options[i]=null;
  }
}
function changeMenu(classList,classMenu){//显示选择列表
  removeinfo(classMenu);
  for (var i=0; i < classList.length; i++){
      classMenu[i]=new Option(classList[i],classList[i]);
  }
}
</script>
 <script>
    function outX()
    {

    dwr.engine.setAsync(false);
  out.logout();
  //alert("recommend表清空了!!!");
    }  
    </script>
  </head>
  
  <body onLoad="outX()" style="font-size:12px">
  <a  id="welcome" href="login.jsp" >登录</a>
  <hr></hr>
  <center>
  <table   border="0" align="center" cellpadding="0" cellspacing="0"> 
   <tr>
   <center>
     <table  border="0"  cellpadding="2" cellspacing="1" >
      <form name="form1">
          <td height="22" align="right">所属类别:</td>
          <td height="22" align="left"><select name="leibie" id="leibie" onChange="changeMenu(arr2[document.form1.leibie.options[document.form1.leibie.selectedIndex].text],document.form1.fenlei);"><!-- 实现多类别之间关联 -->
              <option selected>选择类别</option>
              <option>综合搜索</option>
              <option>女式上衣</option>
              <option>女式外套</option>
              <option>女式裤装</option>
              <option>女式裙装</option>
              <option>男士上衣</option>
              <option>男士外套</option>
              <option>男士裤装</option>        
            </select>
              <select name="fenlei" id="fenlei">
                <option>选择分类</option>               
                </select></td>
          <td height="22" align="right">搜素关键字:</td>
          <td height="22" align="left"><input name="goodsname" type="text" id="goodsname" size="30" maxlength="50"></td>
          <td height="22" colspan="2" align="center"><input type="button" name="search" value="搜索" id="search" onClick="se();"/>
          &nbsp;
        <input type="reset" name="Submit" value="重 置"></td>
      </form>
    </table>
    </center>
 </tr> 
  <tr><center><input type="button" id="recommend" value="为我推荐"  onClick="window.location='Preference.jsp'"/></center></tr>
  <tr > <div height="300px" width="800px">&nbsp</div>   </tr>
  <tr><center><img src="./images/9.jpg" height="100" width="700"></center></tr>
  <tr><center><img src="./images/10.jpg" height="100" width="700"></center></tr>
</table>
</center>
</body>
</html>
