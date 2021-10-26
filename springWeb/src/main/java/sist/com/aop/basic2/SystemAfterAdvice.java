package sist.com.aop.basic2;

import java.lang.reflect.Method;

import org.springframework.aop.AfterReturningAdvice;

//AfterReturningAdvice와 AfterAdvice의 차이: AfterReturningAdvice는 메인이 에러나면 불러지지 않고, AfterAdvice는 에러나도 불러짐
public class SystemAfterAdvice implements AfterReturningAdvice{

	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("AfterReturningAdvice............");
		
		
	}

	
}
