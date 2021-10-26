package sist.com.aop.basic3;


import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component(value="actionAspect")
public class AspectAction {
	//시간이 공통으로 나오게 설정함
	//Joinpoint: 시그니쳐 인터페이스와 연결 - 공통부분 이외부분은 각각 지정해줌

	@Before("execution(public * sist.com.aop.basic3.Search*.*())")
	public void beforeProcess(JoinPoint jp) {
		Signature signature=jp.getSignature();
		Date date=new Date();
		System.out.println("Before"+date);
		
		String methodName=signature.getName();
		if(methodName.equals("fileSearch")) {
			System.out.println("fileSearch signature");
		}
		else if(methodName.equals("xmlParsing")) {
			System.out.println("xmlParsing signature");
		}
		else if(methodName.equals("domSaxAearch")) {
			System.out.println("domSaxAearch signature");
		}
	}
	
	@After("execution(public * sist.com.aop.basic3.Search*.*())")
	public void afterProcess() {
		System.out.println("afterProcess");
	}
	
	@AfterReturning("execution(public * sist.com.aop.basic3.Search*.*())")
	public void afterReturningProcess() {
		System.out.println("afterReturningProcess");
	}
	
	@AfterThrowing("execution(public * sist.com.aop.basic3.Search*.*())")
	public void AfterThrowing() {
		System.out.println("AfterThrowing");
	}
	
	//around: 핵심모듈 실행될 위치 예외로 지정해줌
	@Around("execution(public * sist.com.aop.basic3.Search*.*())")
	public void aroundProcess(ProceedingJoinPoint pp) throws Throwable {
		System.out.println("aroundBeforeProcess");
		try {
			pp.proceed();
		} catch (Exception e) {
			 e.printStackTrace();
		}
		System.out.println("aroundAfterProcess");
	}
}
