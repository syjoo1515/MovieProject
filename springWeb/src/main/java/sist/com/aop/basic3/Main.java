package sist.com.aop.basic3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	public static void main(String[] args) {
		//aop를 어노테이션
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/aop/basic3/search.xml");
		Search search=(Search) context.getBean("searchImp");
		search.domSaxAearch();
	}

}
