package com.zf.jsoup;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test {

	public static void main(String[] args) throws Exception {
		
		Connection conn = Jsoup.connect("http://www.hao123.com");
		Document document = conn.get();
		
		//解析出 class为feedback的li标签  的后代a标签元素
		Elements elements = document.select("a");
		  
		for (Element element : elements) {
			System.out.println(element.html());
			System.out.println(element.attr("href"));
		}
		  
	}
	
}
