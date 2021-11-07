package sist.com.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.MovieVO;

@Repository //bean객체로 지정
public class MovieDao  extends SqlSessionDaoSupport{

	@Resource(name="sqlSessionTemplate")
	protected void initDao(SqlSessionTemplate st) throws Exception {
	   // TODO Auto-generated method stub
	   this.setSqlSessionTemplate(st);
	}
	
	 //DB에 영화 데이터 insert
	   public void insertMoiveData(Map<String, Object> map) {
		   this.getSqlSession().insert("insertMoiveData",map);
	   }
	   
	   //영화명으로 데이터 검색 후 리턴
	   public List<MovieVO> searchMovie(String title) {
		   return this.getSqlSession().selectList("searchMovie",title);
	   }
	   
	   //감독명으로 데이터 검색 후 리턴
	   public List<MovieVO> searchDirector(String director){
		   return this.getSqlSession().selectList("searchDirector", director);
	   }
	   
		//배우명으로 검색 후 리턴
	   public List<MovieVO> searchActor(String actor){
		   return this.getSqlSession().selectList("searchActor", actor);
	   }
	   
	   //DB에서 영화 코드 select
	   public List<String> movieCdSelect() {
		   return this.getSqlSession().selectList("movieCdSelect");
	   }
	   
		//DB에 영화 이미지 insert
	   public void insertMovieImg(Map<String, String>map) {
		   this.getSqlSession().insert("insertMovieImg",map);
	   }
	   
	   //DB에서 영화 이미지 select
	   public MovieVO searchMovieByCd(String movieCd) {
		   return this.getSqlSession().selectOne("searchMovieByCd", movieCd);
	   }
	   
		//DB에 상세정보 inert
		public void movieDetailInsert(MovieVO vo) {
			this.getSqlSession().insert("movieDetailInsert", vo);
		}
		

}
