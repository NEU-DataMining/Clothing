package action;

import javax.servlet.http.HttpServletRequest;
import javax.swing.JOptionPane;

import com.opensymphony.xwork2.ActionSupport;

import service.loginservice;

public class mylogin extends ActionSupport{
	
	private String username;
	private String password;
	private String isFirst;
	private String isAdmin;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIsFirst() {
		return isFirst;
	}
	public void setIsFirst(String isFirst) {
		this.isFirst = isFirst;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String execute() {
		if(isFirst.equals("true"))
			return "userregister";
		else if(isAdmin.equals("true"))
			return "adminlogin";
		else{
			return "userlogin";
		}
	}

}
