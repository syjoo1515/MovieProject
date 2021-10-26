package sist.com.aop.basic2;

import java.lang.reflect.Method;

import org.springframework.aop.MethodBeforeAdvice;

public class SystemBeforeAdvice implements MethodBeforeAdvice{

	@Override
	public void before(Method method, Object[] args, Object target) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("Before............");
	}
	
	

}
