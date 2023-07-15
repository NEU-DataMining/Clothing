package action;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.struts2.ServletActionContext;

import service.Listservice;

import com.opensymphony.xwork2.ActionSupport;

public class searcher extends ActionSupport{
	
	private HttpServletRequest request = ServletActionContext.getRequest ();
	private String username=request.getParameter("name");
	private String subtype=request.getParameter("sub");
	private String goodsname=request.getParameter("goods");
	private String t=request.getParameter("t");
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public String execute() {
	
	//Listservice list=new Listservice();	
	//System.out.println(subtype);
	//System.out.println(username);
	//Object li=null;
//	if(t.equals("0"))
//	{
		//if(subtype.equals("全体分类")&&goodsname.equals("")){
			//li=list.findgoodsListRecommend(username);//本科
			//li=list.findgoodsList();//研究生
//		}else if(subtype.equals("全体分类")){
//			li=list.findgoodsListAllType(goodsname,username);
//		}
//		else{
//			li=list.findgoodsList(subtype,goodsname,username);
//		}
//	}
//	else 
//	{
//		li=list.goodsrank(t,goodsname,username);
//	}
//	if(li==null)
//	{
//		JOptionPane.showMessageDialog(null,"没有结果，请重新搜索");
//		return "fail";
//	}
//	else
//	{
//	request.setAttribute("username",username);
//	request.setAttribute("goodsname",goodsname);
//	request.setAttribute("subtype",subtype);
//	request.setAttribute("se",li);
	//return "show";
	return "fail";
//	}
    }
}

