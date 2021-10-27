package sist.com.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository //bean객체로 지정
public class mainDao extends SqlSessionDaoSupport{
	
	   @Resource(name="sqlSessionTemplate")
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      // TODO Auto-generated method stub
	      this.setSqlSessionTemplate(st);
	   }
	   
	   public boolean loginCheck(String id, String password) {
		   String dbpassword= this.getSqlSession().selectOne("loginCheck", id);
		   if(password.equals(dbpassword)) return true;
		   else return false;
	   }

}
