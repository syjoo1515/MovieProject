package sist.com.aop.core;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

//Aspect: 공통부분을 모듈화한 것. Advice와 PointCut을 합친 것이다.
@Aspect
@Component(value="action")
public class ActionAspect {
	
	@Before("execution(public * sist.com.dao.*.*())")
	public void fileBeforeAspect() {
		System.out.println("공통단 before");
	}
	
	@After("execution(public * sist.com.dao.*.*())")
	public void fileAfterAspect() {
		System.out.println("공통단 after");
	}

}
