<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Preference.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />


  </head>
  
  <body>

  <center>
     <table   border="0" align="center" cellpadding="0" cellspacing="0" > 
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
 <tr >
 <center>
 	<td>
 		<table id="history">
 			<ul>
 			<tr id="color"><td>颜色:</td><td><li><img src="./images/ClothingData/01/1.jpg"/></li>&nbsp; &nbsp;<li><img src="./images/ClothingData/02/1.jpg"/></li>&nbsp<li><img src="./images/ClothingData/03/1.jpg"/></li>&nbsp<li><img src="./images/ClothingData/04/1.jpg"/></li></td></tr>
 			<tr id="pattern"><td>图案:</td><td><li><img src="./images/ClothingData/01/2.jpg"/></li>&nbsp<li><img src="./images/ClothingData/02/2.jpg"/></li>&nbsp<li><img src="./images/ClothingData/03/2.jpg"/></li>&nbsp<li><img src="./images/ClothingData/04/2.jpg"/></li></td></tr>
 			<tr id="collar"><td>领子:</td><td><li><img src="./images/ClothingData/01/3.jpg"/></li>&nbsp<li><img src="./images/ClothingData/02/3.jpg"/></li>&nbsp<li><img src="./images/ClothingData/03/3.jpg"/></li>&nbsp<li><img src="./images/ClothingData/04/3.jpg"/></li></td></tr>
 			<tr id="sleeve"><td>袖子:</td><td><li><img src="./images/ClothingData/01/4.jpg"/></li>&ensp;<li><img src="./images/ClothingData/01/5.jpg"/></li>&nbsp;<li><img src="./images/ClothingData/02/4.jpg"/></li>&ensp;<li><img src="./images/ClothingData/02/5.jpg"/></li>&nbsp;<li><img src="./images/ClothingData/03/4.jpg"/></li>&ensp;<li><img src="./images/ClothingData/03/5.jpg"/></li>&nbsp;<li><img src="./images/ClothingData/04/4.jpg"/></li>&ensp;<li><img src="./images/ClothingData/04/5.jpg"/></li></td></tr>
 			<tr id="split-joint"><td>拼接:</td><td><li><img src="./images/ClothingData/01/1.jpg"/></li>&nbsp<li><img src="./images/ClothingData/02/1.jpg"/></li>&nbsp<li><img src="./images/ClothingData/03/1.jpg"/></li>&nbsp<li><img src="./images/ClothingData/04/1.jpg"/></li></td></tr>
 			<tr id="category"><td>类别:</td><td><li><button>女士衬衫</button></li></td></tr>
 			<tr id="tag"><td>关键字:</td><td><table><tr><li><button>长袖</button></li>&nbsp<li><button>雪纺</button></li><li><button>娃娃领</button></li><li><button>通勤</button></li><li><button>Lucybaily/璐丝百丽</button></li></tr><tr><li><button>Naivee/纳薇</button></li><li><button>蝴蝶结</button></li><li><button>系带</button></li><li><button>修身</button></li></tr><tr><li><button>Sentubila/尚都比拉</button></li><li><button>翻领</button></li></tr><tr><li><button>淑女</button></li><li><button>POLO领</button></li><li><button>ELF SACK/妖精的口袋</button></li><li><button>街头</button></li></tr></table></td></tr>
 		</ul>
 		</table>
 	</td><td><input type="button" id="recommend" value="为我推荐"  onClick="window.location='RecommendResult.jsp'"/></td>
 </center>
 </tr>
</table>
<br>
</center>
	<script src='js/jquery.js'></script><!-- 用于实现选中效果 -->
    <script src="js/index.js"></script>
  </body>
</html>
