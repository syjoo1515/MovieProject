package sist.com.di.basic;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class PersonMain {
	
	public static void main(String[] args) {
//		bean���� �̱����� ��� �Ʒ� �ڵ常���� Person ������ �ҷ��� �� ����, ������Ÿ���� ���� �ȵ�
		//������Ÿ��: �Ʒ� �ڵ忡���� ������ �ȵǰ� bean�� ȣ���ؾ� ��ü�� ������(�Ʒ� �ڵ常 �������� ������ ȣ�� �ȵ�), �̱����϶��� ���� �������� �ʾƵ� ��ü�� ������ ��(�ε� �������� person��ü�� �����ϱ� ������)
		//��ü�� �����Ǿ����� Ȯ���ϴ� ���: personŬ�������� ������ ȣ��� Person()������ �س�����
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/di/basic/personDi.xml");
/*		System.out.println(context.getBean("person1")); 
		
		//�̱����� ���� true, ������Ÿ���� ���� false����
		Object o1=context.getBean("person1");
		Object o2=context.getBean("person1");
		System.out.println(o1==o2);
		
		//�̱����϶��� set�� �������� �ٲ��, ������Ÿ���� ���� �ٲ��� ����(���ο� �޸𸮿� ��������°ű� ������-������Ÿ���� ��� getBean�� �� new�� ���� ������)
		((Person)context.getBean("person1")).setName("����");
		System.out.println(((Person)context.getBean("person1")).getName());
	*/	
		//��ü�� �̸� ���� �� ����, ��Ȳ�� �°� ��� �� �� ���� (personDi���� person1 person2 ���� �����صΰ� ����ϴ°�)
/*		System.out.println(context.getBean("person1"));
		System.out.println(context.getBean("person2"));*/
		System.out.println(context.getBean("person1"));
		
	}

}
