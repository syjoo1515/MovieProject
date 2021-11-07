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
	
	   //review insert
	   public void reviewForm(ReviewVO vo) {
		   this.getSqlSession().insert("reviewForm",vo);
	   }
	   
	 //리뷰 작성한거 DB에서 select-영화명기준
	   public List<ReviewVO> showReview(String movieCd){
		   return this.getSqlSession().selectList("showReview", movieCd);
	   }
	   
	 //리뷰 작성한거 DB에서 select-id기준
	   public List<ReviewVO> writingMovieSelect(String id){
		   return this.getSqlSession().selectList("writingMovieSelect",id);
	   }
}
