package sist.com.aop.basic;

import org.springframework.aop.ThrowsAdvice;

public class ExceptionAdvice implements ThrowsAdvice {
	public void exceptionMessage() {
		System.out.println("exceptionMessage");
	}

}
