package service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.cfg.*;
import org.hibernate.*;

import bean.User;

public class registerservice {

	private String username;
	private String password;
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	@SuppressWarnings("deprecation")
	public boolean finduser()
	{
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.User as p where p.userName="+"\'"+username+"\'";
		@SuppressWarnings("unchecked")
		List<User> list=session.createQuery(hql).list();
		tx.commit();
		session.close();
		sf.close();
		
		if(list.isEmpty())
			return false;
		else
			return true;
	}
	public String findauser(String username,String email)
	{
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.User as p where p.userName="+"\'"+username+"\'";
		@SuppressWarnings("unchecked")
		List<User> list=session.createQuery(hql).list();
		tx.commit();
		session.close();
		sf.close();
		
		if(list.isEmpty())
		{
			
			sf=new Configuration().configure().buildSessionFactory();
			session=sf.openSession();
			tx=session.beginTransaction();
			hql="from bean.User as p where p.email="+"\'"+email+"\'";
			list=session.createQuery(hql).list();
			tx.commit();
			session.close();
			sf.close();
			if(list.isEmpty())
				return "ok";
			else
				return "existemail";
		}
		else
			return "existuser";
	}
	public String checkauser(String username,String email)
	{
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.User as p where p.userName="+"\'"+username+"\'";
		@SuppressWarnings("unchecked")
		List<User> list=session.createQuery(hql).list();
		tx.commit();
		session.close();
		sf.close();
		
		if(!list.isEmpty())
		{
			if(list.get(0).getEmail().equals(email))
				return "ok";
			else
				return "fail";
		}
		else
			return "notexistuser";
	}
	public void register()
	{
		User one=new User();
		one.setPassWord(password);
		one.setUserName(username);
		one.setEmail(email);
		
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		session.save(one);
		tx.commit();
		session.close();
		sf.close();
	}
}
