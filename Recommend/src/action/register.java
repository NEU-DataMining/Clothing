package action;

import javax.swing.JOptionPane;

import service.loginservice;
import service.registerservice;

public class register {

	private String username;
	private String password;
	private String passwordcheck;
	private String email;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswordcheck() {
		return passwordcheck;
	}
	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}
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


	public String execute() {
		registerservice one=new registerservice();
		one.setPassword(password);
		one.setUsername(username);
		one.setEmail(email);
		if(!password.equals(passwordcheck))
		{
			JOptionPane.showMessageDialog(null, "密码不一致!");
			return "fail";
		}
		else if(!one.finduser())
		{
			one.register();
			return "ok";
		}
		else
		{
			JOptionPane.showMessageDialog(null, "用户已存在!");
			return "fail";
		}
		
	}
}
