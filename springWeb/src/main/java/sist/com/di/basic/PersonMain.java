package sist.com.di.basic;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class PersonMain {
	
	public static void main(String[] args) {
//		bean에서 싱글톤일 경우 아래 코드만으로 Person 생성자 불러올 수 있음, 프로토타입일 때는 안됨
		//프로토타입: 아래 코드에서는 생성이 안되고 bean을 호출해야 객체가 생성됨(아래 코드만 있을때는 생성자 호출 안됨), 싱글톤일때는 빈을 생성하지 않아도 객체가 생성이 됨(로딩 시점에서 person객체를 생성하기 때문에)
		//객체가 생성되었는지 확인하는 방법: person클래스에서 생성자 호출시 Person()찍히게 해놓음ㅎ
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/di/basic/personDi.xml");
/*		System.out.println(context.getBean("person1")); 
		
		//싱글톤일 때는 true, 프로토타입일 때는 false나옴
		Object o1=context.getBean("person1");
		Object o2=context.getBean("person1");
		System.out.println(o1==o2);
		
		//싱글톤일때는 set한 내용으로 바뀌고, 프로토타입일 때는 바뀌지 않음(새로운 메모리에 만들어지는거기 때문에-프로토타입의 경우 getBean할 때 new로 새로 생성됨)
		((Person)context.getBean("person1")).setName("영희");
		System.out.println(((Person)context.getBean("person1")).getName());
	*/	
		//객체를 미리 설계 한 다음, 상황에 맞게 골라서 쓸 수 있음 (personDi에서 person1 person2 각각 정의해두고 사용하는것)
/*		System.out.println(context.getBean("person1"));
		System.out.println(context.getBean("person2"));*/
		System.out.println(context.getBean("person1"));
		
	}

}
