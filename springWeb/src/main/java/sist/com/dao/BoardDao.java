package sist.com.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import sist.com.vo.MvcBoardVo;
import sist.com.vo.ScrapVO;
import sist.com.vo.StudentVO;


//https://itstein.tistory.com/9
//@Repository: Dao객체만 별도의 공간에서 생성해서 관리
@Repository
//@ComponentScan(value="sist.com.dao")
public class BoardDao extends SqlSessionDaoSupport{

	/*@Autowired*/
	   @Resource(name="sqlSessionTemplate")
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      // TODO Auto-generated method stub
	      this.setSqlSessionTemplate(st);
	   }
	   //시퀀스 번호 가져옴 (-새글/답글 로직에서 시퀸스 번호 사용하기 위해)
	   public Integer getSequence() {
		   return this.getSqlSession().selectOne("getSequence");
	   }
	   
	   //mybatis객체인 insert로 인해 값들이 DB에 알아서 들어감
	   public void insertBoard(MvcBoardVo vo) {
	      this.getSqlSession().insert("insertBoard",vo);
	   }
	   
	   //답글이 달리거나 삭제되면 해당 부모글의 reply를 변경해줌 (삭제인지 답글인지는 mapper에서 확인-근데 난 controller에서 구분해서 넘어옴)
	   public void updateReply(HashMap<String, Object>map) {
		   this.getSqlSession().update("updateReply",map);
	   }
	   
	   //답글이 달리거나 삭제되면 해당 부모글의 STEP를 변경해줌
	   public void updateStep(HashMap<String, Object>map) {
		      this.getSqlSession().update("updateStep",map);
	   }
	   
	   //DB에 저장된 게시판 글 가져옴 (리스트로 출력)
	   public List<MvcBoardVo> selectBoard() {
		   return this.getSqlSession().selectList("selectBoard"); 
	   }
	   
	   //로그인 처리(memberinfo에 저장된 id,password로)
	   public Boolean loginCheck(String id, String password) {
		   String dbpass=this.getSqlSession().selectOne("loginCheck", id);
		   return dbpass!=null&&dbpass.equals(password.trim());
	   }
	   
	   //db의 hit값에서 1을 더한 값 저장
	   public void updateHit(int no) {
		   this.getSqlSession().update("updateHit", no);
	   }
	   
	   //DB에 저장된 글의 정보 가져옴 (상세페이지)
	   public MvcBoardVo boardInfo(int no) {
		   return this.getSqlSession().selectOne("boardInfo",no);
	   }
	   
	   //패스워드 가져와서 일치하면 글 수정/삭제 가능하게
	   public String getPassWord(int no) {
		      return this.getSqlSession().selectOne("getPassWord",no);
		}
	
	   //글 삭제
	   public void deleteBoard(int no) {
		   this.getSqlSession().delete("deleteBoard", no);
	   }
	   
	   //글 삭제시 부모의 넘버를 가져오기(reply수를 줄이기위해) 
	   public Integer getParentNumber(int no) {
		   return this.getSqlSession().selectOne("getParentNumber", no);
	   }
	   
	   //글 수정시 DB에 내용 업데이트
	   public void updateBoard(MvcBoardVo vo) {
		   this.getSqlSession().update("updateBoard",vo);
	   }
	   
	   //스크랩 -로그인 후 특정 글의 스크랩을 누르면 SCRAPACTION에 해당 로그인한 id가 있는지 확인
	   public boolean idCheckData(String id) {
		      return this.getSqlSession().selectOne("idCheckData", id)!=null;
		   }

	   //스크랩-SCRAPACTION에 해당 아이디랑 글 번호 저장
	   public void insertScrap(HashMap<String, Object>map) {
		   this.getSqlSession().insert("insertScrap",map);
	   }
	   
	   //스크랩-만약 이미 스크랩을 진행한 id가 있으면 해당 id가 스크랩한 글 번호(SCARAPNO-오타..) 정보 불러오기 
	   public String getScrapNumber(String id) {
		   return this.getSqlSession().selectOne("getScrapNumber",id);
	   }
	   
	   //스크랩-기존에 스크랩 기록이 있는 아이디의 경우 SCARAPNO 정보를 업데이트
	   //10번 글 스크랩 후 11번 글 스크랩할 시 10#11 이런식으로
	   public void updateScrap(ScrapVO v) {
		      this.getSqlSession().update("updateScrap",v);
		}
	   
	   //myPage에 스크랩한 글들만 나오도록 해당 id가 스크랩한 글 넘버와 일치하는 글들을 가져온다
	   public List<MvcBoardVo> selectMyPage(HashMap<String, Object>map){
		   return getSqlSession().selectList("selectMyPage",map);
	   }
	   
	   //번외-ajax
	   public List<StudentVO>selectStudentAction(){
		   return getSqlSession().selectList("selectStudentAction");
	   }
	   
	   //번외-ajax-hashmap으로 (VO 사용안함)
	   public List<HashMap<String, Object>>selectStudentAction2(){
		   return getSqlSession().selectList("selectStudentAction2");
	   }
}
