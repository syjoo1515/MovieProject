package sist.com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.LikeVO;

@Repository
public class LikeDao extends SqlSessionDaoSupport{
	@Resource(name="sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
	   // TODO Auto-generated method stub
	   this.setSqlSessionTemplate(st);
	}
	
	//좋아요시 movielike에 insert
	   public void likeMovieInsert(LikeVO vo) {
		   this.getSqlSession().insert("likeMovieInsert", vo);
	   }
	   
	   //좋아요시 movielike에서 delete
	   public void likeMovieDelete(LikeVO vo) {
		   this.getSqlSession().delete("likeMovieDelete",vo);
	   }
	   
	   //영화 상세정보 페이지 호출 시 찜 여부 확인
	   public String likeMovieSearch(LikeVO vo){
		   return this.getSqlSession().selectOne("likeMovieSearch", vo);
	   }

	   //movielike에서 데이터 select후 내정보에 출력
	   public List<LikeVO> likemovieSelect(String id) {
		   return this.getSqlSession().selectList("likemovieSelect",id);
	   }

}
