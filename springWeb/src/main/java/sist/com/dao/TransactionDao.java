package sist.com.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class TransactionDao extends SqlSessionDaoSupport{

	   @Inject
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      // TODO Auto-generated method stub
	      this.setSqlSessionTemplate(st);
	   }
	   
	   public void insertTransaction(HashMap<String, Object>map) {
		   this.getSqlSession().insert("insertTransaction",map);
	   }
	   
	   public void updateTransaction(HashMap<String, Object>map) {
		   this.getSqlSession().update("updateTransaction2",map);
	   }
	
	

}
