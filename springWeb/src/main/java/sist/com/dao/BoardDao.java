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
//@Repository: Dao��ü�� ������ �������� �����ؼ� ����
@Repository
//@ComponentScan(value="sist.com.dao")
public class BoardDao extends SqlSessionDaoSupport{

	/*@Autowired*/
	   @Resource(name="sqlSessionTemplate")
	   protected void initDao(SqlSessionTemplate st) throws Exception {
	      // TODO Auto-generated method stub
	      this.setSqlSessionTemplate(st);
	   }
	   //������ ��ȣ ������ (-����/��� �������� ������ ��ȣ ����ϱ� ����)
	   public Integer getSequence() {
		   return this.getSqlSession().selectOne("getSequence");
	   }
	   
	   //mybatis��ü�� insert�� ���� ������ DB�� �˾Ƽ� ��
	   public void insertBoard(MvcBoardVo vo) {
	      this.getSqlSession().insert("insertBoard",vo);
	   }
	   
	   //����� �޸��ų� �����Ǹ� �ش� �θ���� reply�� �������� (�������� ��������� mapper���� Ȯ��-�ٵ� �� controller���� �����ؼ� �Ѿ��)
	   public void updateReply(HashMap<String, Object>map) {
		   this.getSqlSession().update("updateReply",map);
	   }
	   
	   //����� �޸��ų� �����Ǹ� �ش� �θ���� STEP�� ��������
	   public void updateStep(HashMap<String, Object>map) {
		      this.getSqlSession().update("updateStep",map);
	   }
	   
	   //DB�� ����� �Խ��� �� ������ (����Ʈ�� ���)
	   public List<MvcBoardVo> selectBoard() {
		   return this.getSqlSession().selectList("selectBoard"); 
	   }
	   
	   //�α��� ó��(memberinfo�� ����� id,password��)
	   public Boolean loginCheck(String id, String password) {
		   String dbpass=this.getSqlSession().selectOne("loginCheck", id);
		   return dbpass!=null&&dbpass.equals(password.trim());
	   }
	   
	   //db�� hit������ 1�� ���� �� ����
	   public void updateHit(int no) {
		   this.getSqlSession().update("updateHit", no);
	   }
	   
	   //DB�� ����� ���� ���� ������ (��������)
	   public MvcBoardVo boardInfo(int no) {
		   return this.getSqlSession().selectOne("boardInfo",no);
	   }
	   
	   //�н����� �����ͼ� ��ġ�ϸ� �� ����/���� �����ϰ�
	   public String getPassWord(int no) {
		      return this.getSqlSession().selectOne("getPassWord",no);
		}
	
	   //�� ����
	   public void deleteBoard(int no) {
		   this.getSqlSession().delete("deleteBoard", no);
	   }
	   
	   //�� ������ �θ��� �ѹ��� ��������(reply���� ���̱�����) 
	   public Integer getParentNumber(int no) {
		   return this.getSqlSession().selectOne("getParentNumber", no);
	   }
	   
	   //�� ������ DB�� ���� ������Ʈ
	   public void updateBoard(MvcBoardVo vo) {
		   this.getSqlSession().update("updateBoard",vo);
	   }
	   
	   //��ũ�� -�α��� �� Ư�� ���� ��ũ���� ������ SCRAPACTION�� �ش� �α����� id�� �ִ��� Ȯ��
	   public boolean idCheckData(String id) {
		      return this.getSqlSession().selectOne("idCheckData", id)!=null;
		   }

	   //��ũ��-SCRAPACTION�� �ش� ���̵�� �� ��ȣ ����
	   public void insertScrap(HashMap<String, Object>map) {
		   this.getSqlSession().insert("insertScrap",map);
	   }
	   
	   //��ũ��-���� �̹� ��ũ���� ������ id�� ������ �ش� id�� ��ũ���� �� ��ȣ(SCARAPNO-��Ÿ..) ���� �ҷ����� 
	   public String getScrapNumber(String id) {
		   return this.getSqlSession().selectOne("getScrapNumber",id);
	   }
	   
	   //��ũ��-������ ��ũ�� ����� �ִ� ���̵��� ��� SCARAPNO ������ ������Ʈ
	   //10�� �� ��ũ�� �� 11�� �� ��ũ���� �� 10#11 �̷�������
	   public void updateScrap(ScrapVO v) {
		      this.getSqlSession().update("updateScrap",v);
		}
	   
	   //myPage�� ��ũ���� �۵鸸 �������� �ش� id�� ��ũ���� �� �ѹ��� ��ġ�ϴ� �۵��� �����´�
	   public List<MvcBoardVo> selectMyPage(HashMap<String, Object>map){
		   return getSqlSession().selectList("selectMyPage",map);
	   }
	   
	   //����-ajax
	   public List<StudentVO>selectStudentAction(){
		   return getSqlSession().selectList("selectStudentAction");
	   }
	   
	   //����-ajax-hashmap���� (VO ������)
	   public List<HashMap<String, Object>>selectStudentAction2(){
		   return getSqlSession().selectList("selectStudentAction2");
	   }
}
