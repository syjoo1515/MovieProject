package sist.com.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.userVO;

@Repository //bean객체로 지정
public class mainDao extends SqlSessionDaoSupport{
	
	   @Resource(name="sqlSessionTemplate")
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      // TODO Auto-generated method stub
	      this.setSqlSessionTemplate(st);
	   }
	   
	   //로그인-id값 가져와서 DB의 정보와 비교
	   public boolean loginCheck(String id, String password) {
		   String dbpassword= this.getSqlSession().selectOne("loginCheck", id);
		   if(password.equals(dbpassword)) return true;
		   else return false;
	   }
	   
	   //회원가입-id값 중복체크 (있으면 true, 없으면 false)
	   public boolean idCheck(String id) {
		   String idcheck=this.getSqlSession().selectOne("loginCheck", id);
		   if(idcheck==null||idcheck.isEmpty()) return false;
		   else return true;
	   }
	   
	   //시퀸스 가져옴
	   public Integer getSequence() {
		   return this.getSqlSession().selectOne("getSequence");
	   }
	   
	   //회원가입- DB에 값 넣기
	   public void joinAction(userVO user) {
		   this.getSqlSession().insert("joinAction",user);
	   }

}
