package sist.com.aop.basic;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class BasicMain {
	
	public static void main(String[] args) {
		//aop를 어노테이션 안쓰고 xml로
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/aop/basic/basic.xml");
		Dao dao=(Dao) context.getBean("mybatisDao"); //basic에서 생성한 mybatisDao객체
		//dao.appInsert(10);
		dao.appDelete();
		//dao.appUpdate(10.1);
	}
}
