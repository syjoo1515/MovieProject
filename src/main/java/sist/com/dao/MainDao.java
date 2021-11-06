package sist.com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.LikeMovieVO;
import sist.com.vo.MoviePosterVO;
import sist.com.vo.MovieVO;
import sist.com.vo.UserVO;
import sist.com.vo.WritingVO;

@Repository //bean객체로 지정
public class MainDao extends SqlSessionDaoSupport{
	
	//얘가 트랜잭션
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
	   public void joinAction(UserVO vo) {
		   this.getSqlSession().insert("joinAction",vo);
	   }
	   
	   //id로 회원 정보 가져오기
	   public UserVO userInfo(String id) {
		   return this.getSqlSession().selectOne("userInfo", id);
	   }
	   
	   //회원정보 업데이트
	   public void updateAction(UserVO vo) {
		   this.getSqlSession().update("updateAction", vo);
	   }
	   
	   //회원정보 삭제
	   public void deleteAction(String id) {
		   this.getSqlSession().delete("deleteAction", id);
		   
	   }
	   
	   //DB에 영화 데이터 insert
	   public void insertMoiveData(Map<String, Object> map) {
		   this.getSqlSession().insert("insertMoiveData",map);
	   }
	   
	   //DB에서 영화 데이터 검색 후 리턴
	   public List<MoviePosterVO> searchMovie(String title) {
		   return this.getSqlSession().selectList("searchMovie",title);
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
	   public MoviePosterVO searchMovieByCd(String movieCd) {
		   return this.getSqlSession().selectOne("searchMovieByCd", movieCd);
	   }
	   
	   //좋아요시 movielike에 insert
	   public void likeMovieInsert(LikeMovieVO vo) {
		   this.getSqlSession().insert("likeMovieInsert", vo);
	   }
	   
	   //좋아요시 movielike에서 delete
	   public void likeMovieDelete(LikeMovieVO vo) {
		   this.getSqlSession().delete("likeMovieDelete",vo);
	   }
	   
	   //영화 상세정보 페이지 호출 시 찜 여부 확인
	   public String likeMovieSearch(LikeMovieVO vo){
		   return this.getSqlSession().selectOne("likeMovieSearch", vo);
	   }

	   //movielike에서 데이터 select후 내정보에 출력
	   public List<LikeMovieVO> likemovieSelect(String id) {
		   return this.getSqlSession().selectList("likemovieSelect",id);
	   }
	   
	   //review insert
	   public void reviewForm(WritingVO vo) {
		   this.getSqlSession().insert("reviewForm",vo);
	   }
	   
	 //리뷰 작성한거 DB에서 select-영화명기준
	   public List<WritingVO> showReview(String movieCd){
		   return this.getSqlSession().selectList("showReview", movieCd);
	   }
	   
	 //리뷰 작성한거 DB에서 select-id기준
	   public List<WritingVO> writingMovieSelect(String id){
		   return this.getSqlSession().selectList("writingMovieSelect",id);
	   }
}
