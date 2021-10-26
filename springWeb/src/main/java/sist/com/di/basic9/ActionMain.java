package sist.com.di.basic9;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class ActionMain {
	
	public static void main(String[] args) {
		ApplicationContext context=new AnnotationConfigApplicationContext(ActionConfig.class);
		Action action=(Action)(context.getBean("action"));
		System.out.println(action);
		action.setActionCount(1);
		action.setActionName("가나다");
		action.setActionNode("Hello");
		System.out.println(action.getActionCount());
		Action a=new Action("ㅁㄴㅁㄴ", 1, "ㅡ느느");
	}

}
