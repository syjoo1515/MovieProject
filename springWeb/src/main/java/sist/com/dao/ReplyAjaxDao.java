package sist.com.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.ReplyVO;

@Repository
public class ReplyAjaxDao extends SqlSessionDaoSupport{

	   @Inject
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      // TODO Auto-generated method stub
	      this.setSqlSessionTemplate(st);
	   }
	   
	   //시퀸스 번호 가져옴
	   public Integer getAjaxSequence() {
		   return this.getSqlSession().selectOne("getAjaxSeqeunce");
	   }
	   
	   //DB에 reply값 넣기
	   public void insertAjaxReply(ReplyVO vo) {
		   this.getSqlSession().insert("insertAjaxReply",vo);
	   }
	   
	   //DB에 저장된 reply데이터 모두 가져오기/
		public List<ReplyVO>selectAjaxReply(){
			return this.getSqlSession().selectList("selectAjaxReply");
		}
		
		//DB에서 저장된 열 삭제
		public void deleteAjaxReply(int no) {
			this.getSqlSession().delete("deleteAjaxReply", no);
		}
		
		
}

