package sist.com.aop.basic;

import org.springframework.aop.BeforeAdvice;

public class BeforeAdviceBean implements BeforeAdvice{ //BeforeAdvice: �޼ҵ尡 �ƹ��͵� ���� �������̽�
	
	public void beforeMethod() {
		//�ٽɱ���� ����Ǳ� ���� ���������� ����Ǵ� �κ� (����)
		System.out.println("DatabaseConnectionAction");
		System.out.println("DatabasePrepared----------");
	}

}
