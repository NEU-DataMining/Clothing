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
		
		//������ classΪfeedback��li��ǩ  �ĺ��a��ǩԪ��
		Elements elements = document.select("a");
		  
		for (Element element : elements) {
			System.out.println(element.html());
			System.out.println(element.attr("href"));
		}
		  
	}
	
}
