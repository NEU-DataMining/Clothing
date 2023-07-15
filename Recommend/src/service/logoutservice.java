package service;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import bean.Recommend;


public class logoutservice {
	
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public void logout()
	{
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
			String hql="from bean.Recommend as p";
			List<Recommend> lists=session.createQuery(hql).list();
			for (Iterator<Recommend> i = lists.iterator(); i.hasNext();) 
			{
				session.delete(i.next());//删除所有记录
			}
		tx.commit();
		session.close();
		sf.close();

	}

}
