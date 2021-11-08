package sist.com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.ReviewVO;

@Repository
public class ReviewDao extends SqlSessionDaoSupport{

	@Resource(name="sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
	   // TODO Auto-generated method stub
	   this.setSqlSessionTemplate(st);
	}
		//시퀸스 가져옴
		public Integer getReviewSequence() {
			return this.getSqlSession().selectOne("getReviewSequence");
		}
	
	   //review insert
	   public void reviewForm(ReviewVO vo) {
		   this.getSqlSession().insert("reviewForm",vo);
	   }
	   
	 //리뷰 작성한거 DB에서 select-영화명기준
	   public List<ReviewVO> showReview(String movieCd){
		   return this.getSqlSession().selectList("showReview", movieCd);
	   }
	   
	 //리뷰 작성한거 DB에서 select-id기준
	   public List<ReviewVO> reviewMovieSelect(String id){
		   return this.getSqlSession().selectList("reviewMovieSelect",id);
	   }
	   
	   //리뷰 삭제
	   public void deleteReview(int no) {
		   this.getSqlSession().delete("deleteReview",no);
	   }
	   
	   //리뷰 전체삭제
	   public void deleteAllReview(String id) {
		   this.getSqlSession().delete("deleteAllReview", id);
	   }
	   
	   //리뷰 수정
	   public void reviewFormUpdate(ReviewVO vo) {
		   this.getSqlSession().update("reviewFormUpdate",vo);
	   }
}
