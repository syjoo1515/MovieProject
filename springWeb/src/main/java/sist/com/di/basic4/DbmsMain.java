package sist.com.di.basic4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class DbmsMain {
	
	public static void main(String[] args) {
		//ApplicationContext: 스프링 객체(dom) - 링크를 읽어서 수행함. 자바스크립트의 document와 유사
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/di/basic4/dbaction.xml");
		//System.out.println(context.getBean("sqlSessionFactoryBean"));
		DiController diController=(DiController)context.getBean("diController");
		diController.selectDemo();

	}

}
