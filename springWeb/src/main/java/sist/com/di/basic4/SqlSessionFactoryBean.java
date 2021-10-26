package sist.com.di.basic4;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//myBatic객체-DB를 가지고있음
@Component
public class SqlSessionFactoryBean {
	
/*	//자동묶음.SqlSessionFactoryBean가 하나이면서 Dbms객체가 한개일 경우 @Autowired/@Inject사용하면 자동으로 묶인다
	@Autowired
	@Inject*/
	
	//Dbms객체가 여러개일 경우 @Resource 사용
	@Resource(name="oracleDbms")
	private Dbms dbms;

	@Override
	public String toString() {
		return "SqlSessionFactoryBean [dbms=" + dbms + "]";
	}
	
	

}
