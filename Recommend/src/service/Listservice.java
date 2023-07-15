package service;

import bean.Subtype;
import bean.Goods;
import bean.MyBean;
import bean.User;
import bean.Record;
import bean.Recommend;
import bean.Product;

import java.util.*;
import java.io.*;

import org.hibernate.cfg.*;
import org.hibernate.*;
import bean.MyCell;
public class Listservice {

	@SuppressWarnings({ "deprecation", "unchecked" })
	
	//硕士阶段代码，直接从Product数据库读取数据
	public List<MyCell> findgoodsList() {
		
		ArrayList<MyCell> list = new ArrayList<MyCell>();
		MyCell cell = new MyCell();
		SessionFactory tf = new Configuration().configure()
				.buildSessionFactory();
		Session session1 = tf.openSession();
		Transaction xx = session1.beginTransaction();
		String hql = "from bean.Product as p";// 获取所有服装
		List<Product> products = session1.createQuery(hql).list();
		int i=0;
		
		for (Iterator<Product> gg = products.iterator(); i<50;i++) {
			Product product=gg.next();
			String p_id = product.getId();
			String p_name=product.getName();
			String p_image=product.getPic();
			String p_price=product.getPrice();
			String p_url=product.getUrl();
			cell.setId(p_id);
			cell.setName(p_name);
			cell.setPic(p_image);
			cell.setPrice(p_price);
			cell.setUrl(p_url);
			list.add(cell);
		}
		xx.commit();
		session1.close();
		tf.close();
					
		// 从recommend表里查寻出结果
//		tf = new Configuration().configure().buildSessionFactory();
//		session1 = tf.openSession();
//		xx = session1.beginTransaction();
//		hql = "from bean.Recommend as p order by degree desc";
//		List<Recommend> seven = session1.createQuery(hql).list();
//		for (Iterator<Recommend> rr = seven.iterator(); rr.hasNext();) {
//			Recommend result = rr.next();
//			int id3 = result.getId();
//			SessionFactory ff = new Configuration().configure()
//					.buildSessionFactory();
//			Session session2 = ff.openSession();
//			Transaction tt = session2.beginTransaction();
//			hql = "from bean.Goods as p where id=" + "\'" + id3 + "\'";
//			List<Goods> eight = session2.createQuery(hql).list();
//			int id4 = eight.get(0).getId();
//			float price = eight.get(0).getPrice();
//			String introduce = eight.get(0).getIntroduce();
//			String pic = eight.get(0).getPicture();
//			String url = eight.get(0).getUrl();
//			tt.commit();
//			session2.close();
//			ff.close();
//			bean = new MyBean();
//			bean.setId(id4);
//			bean.setPrice(price);
//			bean.setIntroduce(introduce);
//			bean.setpic(pic);
//			bean.seturl(url);
//			bean.setName(eight.get(0).getGoodsName());
//			list.add(bean);
//		}
//
//		xx.commit();
//		session1.close();
//		tf.close();
		System.out.println(list.size());
		return list;

	}
	
	
	//本科阶段代码
	//按类别和关键字搜索
	public List<MyBean> findgoodsList(String subtype,String goodsname, String username) {
	
		ArrayList<MyBean> list = new ArrayList<MyBean>();
		MyBean bean = null;
		String f = "";
		double a[] = new double[136];
		double b[] = new double[136];
		SessionFactory tf = new Configuration().configure()
				.buildSessionFactory();
		Session session1 = tf.openSession();
		Transaction xx = session1.beginTransaction();
		String hql = "from bean.User as p where p.userName=" + "\'" + username
				+ "\'";// 获取用户名对应的用户id
		List<User> three = session1.createQuery(hql).list();
		int userid = three.get(0).getId();
		hql = "from bean.Subtype as p where p.typeName=" + "\'"+ subtype + "\'";// 根据商品名称获取商品类型id
		List<Subtype> two = session1.createQuery(hql).list();
		Integer typeid = two.get(0).getId();
		xx.commit();
		session1.close();
		tf.close();

		tf = new Configuration().configure().buildSessionFactory();
		session1 = tf.openSession();
		xx = session1.beginTransaction();
		hql = "from bean.Record as p where p.id.userId=" + "\'" + userid
				+ "\' order by p.time desc ";// 根据时间顺序查找用户记录，并作出推荐
		Query query=session1.createQuery(hql);
		query.setFirstResult(0); //开始记录 
		query.setMaxResults(5);//限制最多记录数
		List<Record> four = query.list();
		if (!four.isEmpty()) {
			int h = 5;// 用于记录
			for (Iterator<Record> j = four.iterator(); j.hasNext();) {

			
					Record temp = j.next();
					Integer goodid = temp.getId().getGoodsId();
					Date time = temp.getTime();
					System.out.println(time);
					SessionFactory ff = new Configuration().configure()
							.buildSessionFactory();
					Session session2 = ff.openSession();
					Transaction tt = session2.beginTransaction();
					hql = "from bean.Goods as p where p.id=" + "\'" + goodid
							+ "\'";// 通过商品id找到商品特征
					List<Goods> five = session2.createQuery(hql).list();
					f = five.get(0).getFeature2();
					int texture2 = five.get(0).getTexture();
					tt.commit();
					session2.close();
					ff.close();

					int m = 0;
					try {
						Scanner scanner2 = new Scanner(new FileInputStream(f));
						while (scanner2.hasNextDouble()) {
							b[m] = scanner2.nextDouble();
							m++;
						}
					} catch (FileNotFoundException e) {
					}

					SessionFactory sf = new Configuration().configure()
							.buildSessionFactory();
					Session session = sf.openSession();
					Transaction tx = session.beginTransaction();
					hql = "from bean.Goods as p where p.goodsName like "
							+ "\'%" + goodsname + "%\' and (p.typeId=" + "\'" + typeid + "\')";// 在商品库中搜索商品
					List<Goods> one = session.createQuery(hql).list();

					for (Iterator<Goods> gg = one.iterator(); gg.hasNext();) {

						Goods good = gg.next();
						String feature = good.getFeature2();
						int n = 0;
						try {
							Scanner scanner = new Scanner(new FileInputStream(
									feature));
							while (scanner.hasNextDouble()) {
								a[n] = scanner.nextDouble();
								n++;
							}
						} catch (FileNotFoundException e) {
						}

						int id2 = good.getId();
						int texture = good.getTexture();
						int hit = good.getHit();
						float price = good.getPrice();
						float satisfaction = good.getSatisfaction();
						double s = 0;
						for (int i = 0; i < 128; i = i + 8) {
							s = s
									+ (a[i + 1] + a[i + 2] + a[i + 3]
											+ a[i + 4] + a[i + 5] + a[i + 6]
											+ a[i + 7] - b[i + 1] - b[i + 2]
											- b[i + 3] - b[i + 4] - b[i + 5]
											- b[i + 6] - b[i + 7])
									* (a[i + 1] + a[i + 2] + a[i + 3]
											+ a[i + 4] + a[i + 5] + a[i + 6]
											+ a[i + 7] - b[i + 1] - b[i + 2]
											- b[i + 3] - b[i + 4] - b[i + 5]
											- b[i + 6] - b[i + 7]);
						}
						s = Math.sqrt(s);
						if ((s < 15000 )&& (texture2==texture))
						{
							SessionFactory ttf = new Configuration().configure().buildSessionFactory();
							Session session3 = ttf.openSession();
							Transaction txx = session3.beginTransaction();
							hql = "from bean.Recommend as p where p.id=" + "\'"+ id2 + "\'";//为了看该商品id是否已经在recommend表中
							List<Recommend> six = session3.createQuery(hql).list();
							if (six.isEmpty()) {
							Recommend r = new Recommend();
							double score=(double)(h-0.01*price+satisfaction+0.1*hit);
							r.setHit(hit);
							r.setPrice(price);
							r.setSatisfaction(satisfaction);
							r.setId(id2);
							r.setDegree(h);
							r.setScore(score);
							ff = new Configuration().configure().buildSessionFactory();
							session2 = ff.openSession();
							tt = session2.beginTransaction();
							session2.save(r);
							tt.commit();
							session2.close();
							ff.close();
						}
						txx.commit();
						session3.close();
						ttf.close();
					}
				
			}
			tx.commit();
			session.close();
			sf.close();
		h--;
		}
	}
		xx.commit();
		session1.close();
		tf.close();

		

	SessionFactory sf = new Configuration().configure().buildSessionFactory();//推荐完剩余的商品
	Session session = sf.openSession();
	Transaction tx = session.beginTransaction();
	hql = "from bean.Goods as p where p.goodsName like " + "\'%" + goodsname + "%\'and (p.typeId=" + "\'"+ typeid + "\')";// 在商品库中搜索商品
	query=session.createQuery(hql);
	//query.setFirstResult(0); //开始记录 
	//query.setMaxResults(50);//限制最多记录数
	List<Goods> one = query.list();
	
	for (Iterator<Goods> gg = one.iterator(); gg.hasNext();) 
	{
		Goods good = gg.next();
		int id4 = good.getId();
		int hit = good.getHit();
		float price = good.getPrice();
		float satisfaction = good.getSatisfaction();
		SessionFactory ttf = new Configuration().configure().buildSessionFactory();
		Session session3 = ttf.openSession();
		Transaction txx = session3.beginTransaction();
		hql = "from bean.Recommend as p where p.id=" + "\'" + id4+ "\'";
		List<Recommend> six = session3.createQuery(hql).list();

		if (six.isEmpty()) 
		{
			
			Recommend r = new Recommend();
			double score=-0.01*price+satisfaction+0.1*hit;
			r.setId(id4);
			r.setDegree(0);//只是关键字相同
			r.setHit(hit);
			r.setPrice(price);
			r.setSatisfaction(satisfaction);
			r.setScore(score);
			SessionFactory ff = new Configuration().configure().buildSessionFactory();
			Session session2 = ff.openSession();
			Transaction tt = session2.beginTransaction();
			session2.save(r);
			tt.commit();
			session2.close();
			ff.close();
		}
		txx.commit();
		session3.close();
		ttf.close();

	}
	tx.commit();
	session.close();
	sf.close();

		// 从recommend表里查寻出结果
		tf = new Configuration().configure().buildSessionFactory();
		session1 = tf.openSession();
		xx = session1.beginTransaction();
		hql = "from bean.Recommend as p order by degree desc";
		List<Recommend> seven = session1.createQuery(hql).list();
		for (Iterator<Recommend> rr = seven.iterator(); rr.hasNext();) {
			Recommend result = rr.next();
			int id3 = result.getId();
			SessionFactory ff = new Configuration().configure()
					.buildSessionFactory();
			Session session2 = ff.openSession();
			Transaction tt = session2.beginTransaction();
			hql = "from bean.Goods as p where id=" + "\'" + id3 + "\'";
			List<Goods> eight = session2.createQuery(hql).list();
			int id4 = eight.get(0).getId();
			float price = eight.get(0).getPrice();
			String introduce = eight.get(0).getIntroduce();
			String pic = eight.get(0).getPicture();
			String url = eight.get(0).getUrl();
			tt.commit();
			session2.close();
			ff.close();
			bean = new MyBean();
			bean.setId(id4);
			bean.setPrice(price);
			bean.setIntroduce(introduce);
			bean.setpic(pic);
			bean.seturl(url);
			bean.setName(eight.get(0).getGoodsName());
			list.add(bean);
		}

		xx.commit();
		session1.close();
		tf.close();

		return list;

	}
	@SuppressWarnings({ "deprecation", "unchecked" })
	// 未输入类别但输入了关键字
	public List<MyBean> findgoodsListAllType(String goodsname, String username) {
	
		ArrayList<MyBean> list = new ArrayList<MyBean>();
		MyBean bean = null;
		String f = "";
		double a[] = new double[136];
		double b[] = new double[136];
		SessionFactory tf = new Configuration().configure()
				.buildSessionFactory();
		Session session1 = tf.openSession();
		Transaction xx = session1.beginTransaction();
		String hql = "from bean.User as p where p.userName=" + "\'" + username
				+ "\'";// 获取用户名对应的用户id
		List<User> three = session1.createQuery(hql).list();
		int userid = three.get(0).getId();
		xx.commit();
		session1.close();
		tf.close();

		tf = new Configuration().configure().buildSessionFactory();
		session1 = tf.openSession();
		xx = session1.beginTransaction();
		hql = "from bean.Record as p where p.id.userId=" + "\'" + userid
				+ "\' order by p.time desc ";// 根据时间顺序查找用户记录，并作出推荐
		Query query=session1.createQuery(hql);
		query.setFirstResult(0); //开始记录 
		query.setMaxResults(5);//限制最多记录数
		List<Record> four = query.list();
		if (!four.isEmpty()) {
			int h = 5;// 用于记录
			for (Iterator<Record> j = four.iterator(); j.hasNext();) {

			
					Record temp = j.next();
					Integer goodid = temp.getId().getGoodsId();
					Date time = temp.getTime();
					System.out.println(time);
					SessionFactory ff = new Configuration().configure()
							.buildSessionFactory();
					Session session2 = ff.openSession();
					Transaction tt = session2.beginTransaction();
					hql = "from bean.Goods as p where p.id=" + "\'" + goodid
							+ "\'";// 通过商品id找到商品特征
					List<Goods> five = session2.createQuery(hql).list();
					f = five.get(0).getFeature2();
					int texture2 = five.get(0).getTexture();
					tt.commit();
					session2.close();
					ff.close();

					int m = 0;
					try {
						Scanner scanner2 = new Scanner(new FileInputStream(f));
						while (scanner2.hasNextDouble()) {
							b[m] = scanner2.nextDouble();
							m++;
						}
					} catch (FileNotFoundException e) {
					}

					SessionFactory sf = new Configuration().configure()
							.buildSessionFactory();
					Session session = sf.openSession();
					Transaction tx = session.beginTransaction();
					hql = "from bean.Goods as p where p.goodsName like "
							+ "\'%" + goodsname + "%\'";// 在商品库中搜索商品
					List<Goods> one = session.createQuery(hql).list();

					for (Iterator<Goods> gg = one.iterator(); gg.hasNext();) {

						Goods good = gg.next();
						String feature = good.getFeature2();
						int n = 0;
						try {
							Scanner scanner = new Scanner(new FileInputStream(
									feature));
							while (scanner.hasNextDouble()) {
								a[n] = scanner.nextDouble();
								n++;
							}
						} catch (FileNotFoundException e) {
						}

						int id2 = good.getId();
						int texture = good.getTexture();
						int hit = good.getHit();
						float price = good.getPrice();
						float satisfaction = good.getSatisfaction();
						double s = 0;
						for (int i = 0; i < 128; i = i + 8) {
							s = s
									+ (a[i + 1] + a[i + 2] + a[i + 3]
											+ a[i + 4] + a[i + 5] + a[i + 6]
											+ a[i + 7] - b[i + 1] - b[i + 2]
											- b[i + 3] - b[i + 4] - b[i + 5]
											- b[i + 6] - b[i + 7])
									* (a[i + 1] + a[i + 2] + a[i + 3]
											+ a[i + 4] + a[i + 5] + a[i + 6]
											+ a[i + 7] - b[i + 1] - b[i + 2]
											- b[i + 3] - b[i + 4] - b[i + 5]
											- b[i + 6] - b[i + 7]);
						}
						s = Math.sqrt(s);
						if ((s < 15000 )&& (texture2==texture))
						{
							SessionFactory ttf = new Configuration().configure().buildSessionFactory();
							Session session3 = ttf.openSession();
							Transaction txx = session3.beginTransaction();
							hql = "from bean.Recommend as p where p.id=" + "\'"+ id2 + "\'";//为了看该商品id是否已经在recommend表中
							List<Recommend> six = session3.createQuery(hql).list();

							if (six.isEmpty()) {
							Recommend r = new Recommend();
							double score=(double)(h-0.01*price+satisfaction+0.1*hit);
							r.setHit(hit);
							r.setPrice(price);
							r.setSatisfaction(satisfaction);
							r.setId(id2);
							r.setDegree(h);
							r.setScore(score);
							ff = new Configuration().configure().buildSessionFactory();
							session2 = ff.openSession();
							tt = session2.beginTransaction();
							session2.save(r);
							tt.commit();
							session2.close();
							ff.close();
						}
						txx.commit();
						session3.close();
						ttf.close();
					}
				
			}
			tx.commit();
			session.close();
			sf.close();
		h--;
		}
	}
		xx.commit();
		session1.close();
		tf.close();

		

	SessionFactory sf = new Configuration().configure().buildSessionFactory();//推荐完剩余的商品
	Session session = sf.openSession();
	Transaction tx = session.beginTransaction();
	hql = "from bean.Goods as p where p.goodsName like " + "\'%" + goodsname + "%\'";// 在商品库中搜索商品
	query=session.createQuery(hql);
	//query.setFirstResult(0); //开始记录 
	//query.setMaxResults(50);//限制最多记录数
	List<Goods> one = query.list();
	
	for (Iterator<Goods> gg = one.iterator(); gg.hasNext();) 
	{
		Goods good = gg.next();
		int id4 = good.getId();
		int hit = good.getHit();
		float price = good.getPrice();
		float satisfaction = good.getSatisfaction();
		SessionFactory ttf = new Configuration().configure().buildSessionFactory();
		Session session3 = ttf.openSession();
		Transaction txx = session3.beginTransaction();
		hql = "from bean.Recommend as p where p.id=" + "\'" + id4+ "\'";
		List<Recommend> six = session3.createQuery(hql).list();

		if (six.isEmpty()) 
		{
			Recommend r = new Recommend();
			double score=-0.01*(double)price+(double)satisfaction+0.1*(double)hit;
			r.setId(id4);
			r.setDegree(0);//只是关键字相同
			r.setHit(hit);
			r.setPrice(price);
			r.setSatisfaction(satisfaction);
			r.setScore(score);
			SessionFactory ff = new Configuration().configure().buildSessionFactory();
			Session session2 = ff.openSession();
			Transaction tt = session2.beginTransaction();
			session2.save(r);
			tt.commit();
			session2.close();
			ff.close();
		}
		txx.commit();
		session3.close();
		ttf.close();

	}
	tx.commit();
	session.close();
	sf.close();

		// 从recommend表里查寻出结果
		tf = new Configuration().configure().buildSessionFactory();
		session1 = tf.openSession();
		xx = session1.beginTransaction();
		hql = "from bean.Recommend as p order by degree desc";
		List<Recommend> seven = session1.createQuery(hql).list();
		for (Iterator<Recommend> rr = seven.iterator(); rr.hasNext();) {
			Recommend result = rr.next();
			int id3 = result.getId();
			SessionFactory ff = new Configuration().configure()
					.buildSessionFactory();
			Session session2 = ff.openSession();
			Transaction tt = session2.beginTransaction();
			hql = "from bean.Goods as p where id=" + "\'" + id3 + "\'";
			List<Goods> eight = session2.createQuery(hql).list();
			int id4 = eight.get(0).getId();
			float price = eight.get(0).getPrice();
			String introduce = eight.get(0).getIntroduce();
			String pic = eight.get(0).getPicture();
			String url = eight.get(0).getUrl();
			tt.commit();
			session2.close();
			ff.close();
			bean = new MyBean();
			bean.setId(id4);
			bean.setPrice(price);
			bean.setIntroduce(introduce);
			bean.setpic(pic);
			bean.seturl(url);
			bean.setName(eight.get(0).getGoodsName());
			list.add(bean);
		}

		xx.commit();
		session1.close();
		tf.close();

		return list;

	}
	
	
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	// 未输入搜索条件，完全由系统推荐
	public List<MyBean> findgoodsListRecommend(String username) {
	
		ArrayList<MyBean> list = new ArrayList<MyBean>();
		MyBean bean = null;
		String f = "";
		double a[] = new double[136];
		double b[] = new double[136];
		SessionFactory tf = new Configuration().configure()
				.buildSessionFactory();
		Session session1 = tf.openSession();
		Transaction xx = session1.beginTransaction();
		String hql = "from bean.User as p where p.userName=" + "\'" + username
				+ "\'";// 获取用户名对应的用户id
		List<User> three = session1.createQuery(hql).list();
		int userid = three.get(0).getId();
		xx.commit();
		session1.close();
		tf.close();

		tf = new Configuration().configure().buildSessionFactory();
		session1 = tf.openSession();
		xx = session1.beginTransaction();
		hql = "from bean.Record as p where p.id.userId=" + "\'" + userid
				+ "\' order by p.time desc ";// 根据时间顺序查找用户记录，并作出推荐
		Query query=session1.createQuery(hql);
		query.setFirstResult(0); //开始记录 
		query.setMaxResults(5);//限制最多记录数
		List<Record> four = query.list();
		if (!four.isEmpty()) {
			int h = 5;// 用于记录
			for (Iterator<Record> j = four.iterator(); j.hasNext();) {

			
					Record temp = j.next();
					Integer goodid = temp.getId().getGoodsId();
					Date time = temp.getTime();
					System.out.println(time);
					SessionFactory ff = new Configuration().configure()
							.buildSessionFactory();
					Session session2 = ff.openSession();
					Transaction tt = session2.beginTransaction();
					hql = "from bean.Goods as p where p.id=" + "\'" + goodid
							+ "\'";// 通过商品id找到商品特征
					List<Goods> five = session2.createQuery(hql).list();
					f = five.get(0).getFeature2();
					int texture2 = five.get(0).getTexture();
					tt.commit();
					session2.close();
					ff.close();

					int m = 0;
					try {
						Scanner scanner2 = new Scanner(new FileInputStream(f));
						while (scanner2.hasNextDouble()) {
							b[m] = scanner2.nextDouble();
							m++;
						}
					} catch (FileNotFoundException e) {
					}

					SessionFactory sf = new Configuration().configure()
							.buildSessionFactory();
					Session session = sf.openSession();
					Transaction tx = session.beginTransaction();
					hql = "from bean.Goods as p ";// 在商品库中搜索商品
					List<Goods> one = session.createQuery(hql).list();

					for (Iterator<Goods> gg = one.iterator(); gg.hasNext();) {

						Goods good = gg.next();
						String feature = good.getFeature2();
						int n = 0;
						try {
							Scanner scanner = new Scanner(new FileInputStream(
									feature));
							while (scanner.hasNextDouble()) {
								a[n] = scanner.nextDouble();
								n++;
							}
						} catch (FileNotFoundException e) {
						}

						int id2 = good.getId();
						int texture = good.getTexture();
						int hit = good.getHit();
						float price = good.getPrice();
						float satisfaction = good.getSatisfaction();
						double s = 0;
						for (int i = 0; i < 128; i = i + 8) {
							s = s
									+ (a[i + 1] + a[i + 2] + a[i + 3]
											+ a[i + 4] + a[i + 5] + a[i + 6]
											+ a[i + 7] - b[i + 1] - b[i + 2]
											- b[i + 3] - b[i + 4] - b[i + 5]
											- b[i + 6] - b[i + 7])
									* (a[i + 1] + a[i + 2] + a[i + 3]
											+ a[i + 4] + a[i + 5] + a[i + 6]
											+ a[i + 7] - b[i + 1] - b[i + 2]
											- b[i + 3] - b[i + 4] - b[i + 5]
											- b[i + 6] - b[i + 7]);
						}
						s = Math.sqrt(s);
						if ((s < 15000 )&& (texture2==texture))
						{
							SessionFactory ttf = new Configuration().configure().buildSessionFactory();
							Session session3 = ttf.openSession();
							Transaction txx = session3.beginTransaction();
							hql = "from bean.Recommend as p where p.id=" + "\'"+ id2 + "\'";//为了看该商品id是否已经在recommend表中
							List<Recommend> six = session3.createQuery(hql).list();

							if (six.isEmpty()) {
							Recommend r = new Recommend();
							double score=(double)(h-0.01*price+satisfaction+0.1*hit);
							r.setHit(hit);
							r.setPrice(price);
							r.setSatisfaction(satisfaction);
							r.setId(id2);
							r.setDegree(h);
							r.setScore(score);
							ff = new Configuration().configure().buildSessionFactory();
							session2 = ff.openSession();
							tt = session2.beginTransaction();
							session2.save(r);
							tt.commit();
							session2.close();
							ff.close();
						}
						txx.commit();
						session3.close();
						ttf.close();
					}
				
			}
			tx.commit();
			session.close();
			sf.close();
		h--;
		}
	}
		xx.commit();
		session1.close();
		tf.close();
		
		// 从recommend表里查寻出结果
		tf = new Configuration().configure().buildSessionFactory();
		session1 = tf.openSession();
		xx = session1.beginTransaction();
		hql = "from bean.Recommend as p order by degree desc";
		List<Recommend> seven = session1.createQuery(hql).list();
		for (Iterator<Recommend> rr = seven.iterator(); rr.hasNext();) {
			Recommend result = rr.next();
			int id3 = result.getId();
			SessionFactory ff = new Configuration().configure()
					.buildSessionFactory();
			Session session2 = ff.openSession();
			Transaction tt = session2.beginTransaction();
			hql = "from bean.Goods as p where id=" + "\'" + id3 + "\'";
			List<Goods> eight = session2.createQuery(hql).list();
			int id4 = eight.get(0).getId();
			float price = eight.get(0).getPrice();
			String introduce = eight.get(0).getIntroduce();
			String pic = eight.get(0).getPicture();
			String url = eight.get(0).getUrl();
			tt.commit();
			session2.close();
			ff.close();
			bean = new MyBean();
			bean.setId(id4);
			bean.setPrice(price);
			bean.setIntroduce(introduce);
			bean.setpic(pic);
			bean.seturl(url);
			bean.setName(eight.get(0).getGoodsName());
			list.add(bean);
		}

		xx.commit();
		session1.close();
		tf.close();

		return list;

	}
	
	
	//将推荐结果进行多种排序
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<MyBean> goodsrank(String t,String goodsname,
			String username) {
		ArrayList<MyBean> list = new ArrayList<MyBean>();
		MyBean bean = null;
	    SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		String hql="";
		if(t.equals("1"))
			hql = "from bean.Recommend as p  order by score desc,degree desc";// 综合
		else if (t.equals("2"))
		{
			hql = "from bean.Recommend as p order by price asc,degree desc";// 价格
		}
		else if(t.equals("3"))
		{
			hql = "from bean.Recommend as p  order by satisfaction desc,degree desc";// 评价
		}
		else if(t.equals("4"))
		{
			hql = "from bean.Recommend as p  order by hit desc,degree desc";// 点击率
		}
		List<Recommend> one = session.createQuery(hql).list();
		for (Iterator<Recommend> j = one.iterator(); j.hasNext();) {
			Recommend result = j.next();
			int id = result.getId();
			SessionFactory ff = new Configuration().configure()
					.buildSessionFactory();
			Session session2 = ff.openSession();
			Transaction tt = session2.beginTransaction();
			hql = "from bean.Goods as p where id=" + "\'" + id + "\'";
			List<Goods> three = session2.createQuery(hql).list();
			int id1 = three.get(0).getId();
			float price = three.get(0).getPrice();
			String introduce = three.get(0).getIntroduce();
			String pic = three.get(0).getPicture();
			String url = three.get(0).getUrl();
			tt.commit();
			session2.close();
			ff.close();
			bean = new MyBean();
			bean.setId(id1);
			bean.setPrice(price);
			bean.setIntroduce(introduce);
			bean.setpic(pic);
			bean.seturl(url);
			bean.setName(three.get(0).getGoodsName());
			list.add(bean);
		}

		tx.commit();
		session.close();
		sf.close();
		return list;

	}
	

}
