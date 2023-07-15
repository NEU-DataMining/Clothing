package service;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import bean.Goods;
import bean.User;
import bean.Record;
import bean.RecordId;

import org.hibernate.cfg.*;
import org.hibernate.*;

public class recservice {//推荐service
	
	private String username;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	 public int addhit(int id)//点击数+1（改进同一个用户名只算点击1次）
	 {
		//System.out.println(id);
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.Goods as p where p.id="+"\'"+id+"\'";
		List<Goods> one=session.createQuery(hql).list();
		if(!one.isEmpty())
		{
				int a=one.get(0).getHit();
				a++;
				//System.out.println(a);
				one.get(0).setHit(a);
				session.update(one.get(0));
		}
		tx.commit();
		session.close();
		sf.close();
		return 0;
	 }
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	//存入用户浏览记录表
	 public int addrecord(int id,String username)//
	 {
		//System.out.println(username);
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
		String hql="from bean.User as p where p.userName="+"\'"+username+"\'";
		List<User> one=session.createQuery(hql).list();
		int userid=one.get(0).getId();
		//System.out.println(userid);
	    sf=new Configuration().configure().buildSessionFactory();		
		hql="from bean.RecordId as p where p.userId="+"\'"+userid+"\' and(p.goodsId="+"\'"+id+"\')";//
		List<Record> two=session.createQuery(hql).list();
		Timestamp nowtime=new Timestamp(new Date().getTime());
		if(two.isEmpty())
		{
			RecordId three=new RecordId();
			three.setUserId(userid);
			three.setGoodsId(id);
			Record four=new Record();
			four.setId(three);
			four.setTime(nowtime);
			SessionFactory ff=new Configuration().configure().buildSessionFactory();
			Session session2=ff.openSession();
			Transaction tt=session2.beginTransaction();
			session2.save(four);
			tt.commit();
			session2.close();
			ff.close();
		}
		else
		{
			two.get(0).setTime(nowtime);
		}
		tx.commit();
		session.close();
		sf.close();
		return 0;
	 }
}
