package mail;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import bean.User;

public class Getcode {

	public void getmycode(String username,String email)
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
		String code=list.get(0).getPassWord();
		MailSenderInfo mailInfo = new MailSenderInfo();   
		mailInfo.setMailServerHost("smtp.163.com");   
		mailInfo.setMailServerPort("25");   
		mailInfo.setValidate(true);   
		mailInfo.setUserName("sdd19920830@163.com");   
		mailInfo.setPassword("19920830");//您的邮箱密码   
		mailInfo.setFromAddress("sdd19920830@163.com");   
		mailInfo.setToAddress(email);   
		mailInfo.setSubject("Your Code");   
		mailInfo.setContent("尊敬的"+username+":您的密码是:"+code+",请妥善保管!");   
		//这个类主要来发送邮件  
		SimpleMailSender sms = new SimpleMailSender();  
		sms.sendTextMail(mailInfo);//发送文体格式   
	}
}
