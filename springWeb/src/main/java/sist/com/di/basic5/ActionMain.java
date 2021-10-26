package sist.com.di.basic5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class ActionMain {
	
	public static void main(String[] args) {
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/di/basic5/action.xml");
		((WebController)context.getBean("webController")).viewJs();;
	}

}
