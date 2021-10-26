package sist.com.aop.basic;

import org.springframework.aop.AfterAdvice;

public class AfterAdviceBean implements AfterAdvice{ //AfterAdvice얘도 메소드 없는 인터페리스
	public void afterMethod() {
		System.out.println("Connection Close======");
		System.out.println("AfterDatabaseEnd");
	}

}
