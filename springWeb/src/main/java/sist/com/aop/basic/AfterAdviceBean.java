package sist.com.aop.basic;

import org.springframework.aop.AfterAdvice;

public class AfterAdviceBean implements AfterAdvice{ //AfterAdvice�굵 �޼ҵ� ���� �����丮��
	public void afterMethod() {
		System.out.println("Connection Close======");
		System.out.println("AfterDatabaseEnd");
	}

}
