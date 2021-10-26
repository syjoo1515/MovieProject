package sist.com.di.basic3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class SystemMain {
	
	public static void main(String[] args) {
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/di/basic3/system.xml");
		//getBean: object반환하기 때문에 형변환해야함
		SystemProcess sp=(SystemProcess)context.getBean("Process");
		sp.getDataBaseSystem().connect();
	
	}

}
