package sist.com.di.basic8;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class NodeMain {

	public static void main(String[] args) {
		//xml, �Ϲ� ������̼�, �ڹ� �о �ϴ� ��� ����
		//ApplicationContext: ������ �����̳�, XML�� �ִ� ���� �о���δ�(parser)
		//AnnotationConfigApplicationContext: ������ �ļ��� �о�� class������ 
		ApplicationContext context=new AnnotationConfigApplicationContext(ConfigDemo.class);
		System.out.println(context.getBean("book3"));
		System.out.println(context.getBean("person3"));
	
	}
}
