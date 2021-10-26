package sist.com.di.basic8;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class NodeMain {

	public static void main(String[] args) {
		//xml, 일반 어노테이션, 자바 읽어서 하는 방식 있음
		//ApplicationContext: 스프링 컨테이너, XML에 있는 내용 읽어들인다(parser)
		//AnnotationConfigApplicationContext: 스프링 파서가 읽어온 class파일을 
		ApplicationContext context=new AnnotationConfigApplicationContext(ConfigDemo.class);
		System.out.println(context.getBean("book3"));
		System.out.println(context.getBean("person3"));
	
	}
}
