package sist.com.aop.basic;

import org.springframework.aop.BeforeAdvice;

public class BeforeAdviceBean implements BeforeAdvice{ //BeforeAdvice: 메소드가 아무것도 없는 인터페이스
	
	public void beforeMethod() {
		//핵심기능이 수행되기 전에 공통적으로 수행되는 부분 (예시)
		System.out.println("DatabaseConnectionAction");
		System.out.println("DatabasePrepared----------");
	}

}
