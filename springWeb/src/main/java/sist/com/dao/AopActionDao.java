package sist.com.dao;

import org.springframework.stereotype.Repository;

//AOP 관점에서 여기가 핵심 코드
//@Repository: Dao객체 별도로 관리
@Repository
public class AopActionDao implements ParentDao{

	@Override
	public void fileAccessData() {
		System.out.println("fileAccessData");
		
	}

	@Override
	public void dmlAccessData() {
		System.out.println("dmlAccessData");
		
	}
	
	

}
