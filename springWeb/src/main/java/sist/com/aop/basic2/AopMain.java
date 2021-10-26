package sist.com.aop.basic2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class AopMain {

	public static void main(String[] args) {
		//aop를 어노테이션 안쓰고 xml로
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/aop/basic2/system.xml");
		SystemFile system=(SystemFile) context.getBean("aopBean");
		system.fileCheck();
	
	}
}
