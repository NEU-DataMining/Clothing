<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RecommendResult.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	td div{
	width:100px;
	height:160px;
	overflow:hidden; 
	font-size:10px;
	}
	a{
	target:view_window;
	}
	img{
	width:100px;
	height:100px;
	}

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

  </head>
  
  <body>
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
  </table>
  </center>
    <!-- 推荐结果展示 -->
    <center>
<table>
	<tr>
		<td><div><a href=""><img src="./images/ClothingData/13/0.jpg"/><br>诗凌通格长袖拼接衬衫女通勤印花秋衬衣上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/1.jpg"/><br>妖精的口袋秋装欧美女士衬衣撞色拼接刺绣印花长袖衬衫女</a></div></td>
		<td ><div><a href=""><img src="./images/ClothingData/13/2.jpg"/><br>云思木想秋冬新款女装前短后长宽松长袖刺绣衬衫女上衣23173</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/6.jpg"/><br>尚都比拉波点雪纺衬衫新款秋季女装长袖印花polo领衬衣上衣女</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/7.jpg"/><br>尚都比拉条纹撞色衬衫新款秋季女装长袖印花翻领衬衣修身上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/8.jpg"/><br>冬季新款时尚新款女装POLO领修身针织拼接牛仔长袖套头衬衫女</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/9.jpg"/><br>条纹拼接长袖衬衫女秋装新款韩版女装雪纺衫上衣小衫修身衬衣</a></div></td>
	</tr>
	<tr>
		<td><div><a href=""><img src="./images/ClothingData/13/10.jpg"/><br>白妈妈秋冬装新款女装襯衫雜訊感拼接拉鍊長袖上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/11.jpg"/><br>妖精的口袋盛夏二重奏秋装女撞色欧美拼接刺绣少女棉质衬衫女长袖</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/12.jpg"/><br>迪图正品秋新款 甜美蕾丝拼接雪纺衬衫立领长袖衬衣女士上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/13.jpg"/><br>华伊格秋季新款格子衬衫女英伦修身显瘦牛仔拼接时尚长袖上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/14.jpg"/><br>华伊格秋季牛仔长袖衬衫欧美复古时尚显瘦拼接撞色纯棉衬衣女</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/15.jpg"/><br>沫加秋装新款女装娃娃领衬衣拼接长袖衬衫修身雪纺衫上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/16.jpg"/><br>云思木想秋冬新品女装休闲宽松上衣简约长袖修身衬衫女潮1369</a></div></td>
	</tr>
	<tr>
		<td><div><a href=""><img src="./images/ClothingData/13/3.jpg"/><br>天天特价韩版秋冬休闲打底衫拼接学院风立领假两件长袖衬衫上衣女</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/4.jpg"/><br>春秋季长袖休闲衬衫针织坎肩马甲背心马夹两件套女</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/13/5.jpg"/><br>ZK绣花拼接假两件圆领条纹衬衫女装时尚百搭修身上衣2016秋季新款</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/1.jpg"/><br>Five Plus新品女秋装拼接荷叶边宽松长袖雪纺衬衫2HF4010990</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/2.jpg"/><br>加绒加厚职业装白色衬衫女长袖修身保暖女士衬衣工装工作服秋冬寸</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/3.jpg"/><br>云思木想秋冬女装印花翻领简约上衣百搭衬衣修身休闲长袖衬衫1361</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/4.jpg"/><br>言吾秋装新款女装雪纺衬衫纯色娃娃领宽松长袖系带上衣</a></div></td>
	</tr>
	<tr>
		<td><div><a href=""><img src="./images/ClothingData/11/5.jpg"/><br>立领蕾丝打底衫秋冬女装雪纺衫大码显瘦上衣加绒加厚白衬衫女长袖</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/6.jpg"/><br>秋冬装拼接黑色衬衫女长袖韩版修身OL职业白衬衣工作服工装潮韩国</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/7.jpg"/><br>轩腾秋冬新款韩范女装黑白撞色雪纺衬衫女式长袖休闲打底衬衣女秋</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/8.jpg"/><br>轩腾秋冬新品长袖撞色雪纺衬衫女式百搭打底衬衣韩范女装上衣秋季</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/9.jpg"/><br>尚都比拉撞色长袖衬衫女2016新款秋季女装职业条纹衬衣女士上衣秋</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/11/10.jpg"/><br>尚都比拉蓝色竖条纹衬衫女2016秋季新款女装长袖上衣修身职业衬衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/1.jpg"/><br>秋冬装拼接黑色衬衫女长袖韩版修身OL职业白衬衣工作服工装潮韩国</a></div></td>
	</tr>
	<tr>
		<td><div><a href=""><img src="./images/ClothingData/12/2.jpg"/><br>秋冬装拼接黑色衬衫女长袖韩版修身OL职业白衬衣工作服工装潮韩国</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/3.jpg"/><br>CADIDL卡迪黛尔秋装新款优雅印花时尚拼接高腰羊毛针织连衣裙</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/4.jpg"/><br>CADIDL卡迪黛尔秋装新款时尚拼接波浪纹印花高腰显瘦连衣裙</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/5.jpg"/><br>女装秋装新款针织拼接长袖打底裙 秋冬毛呢格子连衣裙修身</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/6.jpg"/><br>云思木想秋冬新款原创印花袖子挖空蝴蝶绑带5分袖T恤女72408</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/7.jpg"/><br>秋比冬装新款女装 碎花袖子拼接中长款针织打底衫女长袖上衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/8.jpg"/><br>真维斯女装春秋装 千鸟格拼接袖子圆领长袖T恤</a></div></td>
	</tr>
	<tr>
		<td><div><a href=""><img src="./images/ClothingData/12/9.jpg"/><br>真维斯女装 秋装 字母宽松舒适套头圆领长袖卫衣</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/10.jpg"/><br>拉夏贝尔puella普埃拉秋冬新款 印花圆领拼接袖子卫衣 20006842</a></div></td>
		<td><div><a href=""><img src="./images/ClothingData/12/11.jpg"/><br>拉夏贝尔puella普埃拉冬卡通印花撞色面料长袖圆领卫衣女28000004</a></div></td>
	</tr>
</table>
</center>
  </body>
</html>
