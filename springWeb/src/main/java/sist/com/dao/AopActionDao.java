package sist.com.dao;

import org.springframework.stereotype.Repository;

//AOP �������� ���Ⱑ �ٽ� �ڵ�
//@Repository: Dao��ü ������ ����
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
