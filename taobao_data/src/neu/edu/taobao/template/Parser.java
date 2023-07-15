package neu.edu.taobao.template;
import bean.Product;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.cfg.*;
import org.hibernate.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
/**
* 使用URLConnection下载文件或图片并保存到本地。
*
*/

public class Parser {
	private final String commonPath="div.J_TItems";
	private final String id="dl.item";//商品id
	private final String name="dl.item>dd.detail>a[href]";//商品名称
	private final String pic="dl.item>dt.photo>a>img[data-ks-lazyload]";//图片地址
	private final String price="dl.item>dd.detail>div.attribute>div.cprice-area>span.c-price";//价格
	private final String producturl="dl.item>dt.photo>a[href]";//商品链接
	private final String sales_amount="dl.item>dd.detail>div.attribute>div.sale-area>span.sale-num";//月销售量
	private final String reviewcount="dl.item>dd.rates>div.title>h4>a";//评价量
	private final String description="ul#J_AttrUL";//商品描述信息
	private String nextPageUrl;
	private String pic1str;
	private String pic2str;
	private String pic3str;
	private String pic4str;
	private String pic5str;
	//private List<Item> extractedItems;
	public String getNextPage(){
		//If nextpage exists,return the url;If it doesn't exits,will return 0
		return nextPageUrl;
	}
	
	public boolean parse(String url) throws Exception{
		//nextPageUrl="";
		//extractedItems=new LinkedList<Item>();
		Document doc;
		try {
			doc = Jsoup.parse(new URL(url),4000);//如果设置成1ms则Timout
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return true;
		} 
		Element commonElement=doc.select(commonPath).get(0);
		Elements tableElement=commonElement.select("div.item5line1>dl.item");//4个一行显示
		Element nextPage=commonElement.select("div.pagination>a:eq(7)").get(0);//下一页
		nextPageUrl=nextPage.attr("href").trim();//下一页URL
		
		for(Element element:tableElement){
			//build a new obj
			//Item item=new Item();
			String picstr=element.select(pic).get(0).attr("data-ks-lazyload").trim();
			String namestr=element.select(name).get(0).text().trim();
			String pricestr=element.select(price).get(0).text().trim();
			String producturlstr=element.select(producturl).get(0).attr("href").trim();
			String idstr=element.select(id).get(0).attr("data-id").trim();
			@SuppressWarnings("deprecation")
			SessionFactory sf=new Configuration().configure().buildSessionFactory();
			Session session=sf.openSession();
			Transaction tx=session.beginTransaction();
			String hql="from bean.Product as p where p.id="+"\'"+idstr+"\'";
			@SuppressWarnings("unchecked")
			List<Product> list=session.createQuery(hql).list();
			if(list.isEmpty())
			{
			//String sales_amountstr=element.select(sales_amount).get(0).text().trim();
			//String reviewcountstr=element.select(reviewcount).text().trim();
			 
			//商品详细信息
			Document doc1;
			try {
				doc1 = Jsoup.parse(new URL(producturlstr),4000);//如果设置成1ms则Timout
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return true;
			}  
			String b="60x60";//待替换的字符串
			Element piccommonElement=doc1.select("ul#J_UlThumb").get(0);
			Element pic=piccommonElement.select("li:eq(0)>a>img").get(0);//
			pic1str=pic.attr("src").trim();//
			pic1str=pic1str.replaceAll(b,"600x600");
			pic=piccommonElement.select("li:eq(1)>a>img").get(0);
			pic2str=pic.attr("src").trim();
			pic2str=pic2str.replaceAll(b,"600x600");//替换后的字符串
			pic=piccommonElement.select("li:eq(2)>a>img").get(0);
			pic3str=pic.attr("src").trim();
			pic3str=pic3str.replaceAll(b,"600x600");
			pic=piccommonElement.select("li:eq(3)>a>img").get(0);
			pic4str=pic.attr("src").trim();
			pic4str=pic4str.replaceAll(b,"600x600");
			pic=piccommonElement.select("li:eq(4)>a>img").get(0);
			pic5str=pic.attr("src").trim();	
			pic5str=pic5str.replaceAll(b,"600x600");
			//根据图片url下载图片
			String picdownload1="E:/taobao/102748238/"+idstr+"1.jpg";
			String picdownload2="E:/taobao/102748238/"+idstr+"2.jpg";
			String picdownload3="E:/taobao/102748238/"+idstr+"3.jpg";
			String picdownload4="E:/taobao/102748238/"+idstr+"4.jpg";
			String picdownload5="E:/taobao/102748238/"+idstr+"5.jpg";
			String descriptionstr=doc1.select(description).get(0).text().trim();
			URL  picurl=new URL(pic1str); 
		    URLConnection uc=picurl.openConnection(); 
		    InputStream is=uc.getInputStream(); 
		    File file=new File(picdownload1); 
		    FileOutputStream   out   =   new   FileOutputStream(file); 
		    int   i=0; 
		    while   ((i=is.read())!=-1)   { 
		            out.write(i); 
		    } 
		    out.close();
		    is.close();
		    picurl=new URL(pic2str); 
		    uc=picurl.openConnection(); 
		    is=uc.getInputStream(); 
		    file=new File(picdownload2);
		    out   =   new   FileOutputStream(file);
		    i=0; 
		    while   ((i=is.read())!=-1)   { 
		            out.write(i); 
		    } 
		    out.close();
		    is.close();
		    picurl=new URL(pic3str); 
		    uc=picurl.openConnection(); 
		    is=uc.getInputStream(); 
		    file=new File(picdownload3);
		    out   =   new   FileOutputStream(file);
		    i=0; 
		    while   ((i=is.read())!=-1)   { 
		            out.write(i); 
		    } 
		    out.close();
		    is.close();
		    picurl=new URL(pic4str); 
		    uc=picurl.openConnection(); 
		    is=uc.getInputStream(); 
		    file=new File(picdownload4);
		    out   =   new   FileOutputStream(file);
		    i=0; 
		    while   ((i=is.read())!=-1)   { 
		            out.write(i); 
		    } 
		    out.close();
		    is.close();
		    picurl=new URL(pic5str); 
		    uc=picurl.openConnection(); 
		    is=uc.getInputStream(); 
		    file=new File(picdownload5);
		    out   =   new   FileOutputStream(file);
		    i=0; 
		    while   ((i=is.read())!=-1)   { 
		            out.write(i); 
		    } 
		    out.close();
		    is.close();
		    /*item.setPrice(pricestr);
			item.setProducturl(producturlstr);
			item.setId(idstr);
			item.setName(namestr);
			item.setReviewcount(reviewcountstr);
			*/
			Product two=new Product();
			two.setId(idstr);
			two.setName(namestr);
			two.setPic1(pic1str);
			two.setPic2(pic2str);
			two.setPic3(pic3str);
			two.setPic4(pic4str);
			two.setPic5(pic5str);
			two.setPrice(pricestr);
			two.setUrl(producturlstr);
			//two.setSalesamount(sales_amountstr);
			//two.setReviewcount(reviewcountstr);
			two.setDescription(descriptionstr);	
			
			SessionFactory ff=new Configuration().configure().buildSessionFactory();
			Session session1=ff.openSession();
			Transaction tt=session1.beginTransaction();
			session.save(two);
			tt.commit();
			session1.close();
			ff.close();
			
			//extractedItems.add(item);
			}
			tx.commit();
			session.close();
			sf.close();
		}
		
		return false;
	}
	//test program
	public static void main(String[] args) throws Exception {
		Parser parser=new Parser();
		String url="http://qdafs.tmall.com/search.htm?spm=a1z10.3-b.w4011-5440357760.561.zZjmrx&mid=w-5440357760-0&search=y&scene=taobao_shop&pageNo=11&tsearch=y#anchor" +
				"";
		parser.parse(url);
		
			
		/*test extracted items
		System.out.println("items:");
		List<Item> list=parser.getItemsList();
		for(Item item:list){
			
			System.out.println(item.getPrice());
			System.out.println(item.getPic1());
			System.out.println(item.getProductrl());
			System.out.println(item.getId());
			System.out.println(item.getName());
			//System.out.println(item.getDesc());
			System.out.println(item.getSales_amount());
			System.out.println(item.getReviewcount());
			System.out.println("********");
		}*/
		//test next page
		//System.out.println("nextpage="+parser.getNextPage());
		//parser.parse(parser.getNextPage());
		return;
	
	}

}
