package service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.cfg.*;
import org.hibernate.*;

import bean.User;



public class loginservice {
	
	private String username;
	private String password;
	
	
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	/*
	public int finduser()
	{
		@SuppressWarnings("deprecation")
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.User as p where p.userName="+"\'"+username+"\'";
		@SuppressWarnings("unchecked")
		List<User> list=session.createQuery(hql).list();

		if(list.isEmpty())
		{
			//JOptionPane.showMessageDialog(null, "用户不存在!");
			tx.commit();
			session.close();
			sf.close();
			return 0;
		}
		else if(list.get(0).getPassWord().equals(password))
			return 1;
		else
		{
			tx.commit();
			session.close();
			sf.close();
			//JOptionPane.showMessageDialog(null, "密码错误!");
			return 0;
		}
	}
	*/
	//登录使调用
	public String findthisuser(String name,String code )
	{
		@SuppressWarnings("deprecation")
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.User as p where p.userName="+"\'"+name+"\'";
		@SuppressWarnings("unchecked")
		List<User> list=session.createQuery(hql).list();

		if(list.isEmpty())
		{
			tx.commit();
			session.close();
			sf.close();
			return "用户不存在 !";
		}
		
		else if(list.get(0).getPassWord().equals(code))
		{
			if(list.get(0).getUserTypeId()==1){
				tx.commit();
				session.close();
				sf.close();
				return "管理员登录成功!";
			}else{
				tx.commit();
				session.close();
				sf.close();
				return "用户登录成功!";
			}
		}
		else
		{
			tx.commit();
			session.close();
			sf.close();
			return "密码错误!";
		}
	}
}
