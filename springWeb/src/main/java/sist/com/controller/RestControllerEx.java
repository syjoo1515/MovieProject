package sist.com.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.BoardDao;
import sist.com.dao.ReplyAjaxDao;
import sist.com.vo.ReplyVO;
import sist.com.vo.ScrapVO;
import sist.com.vo.StudentVO;

@RestController
public class RestControllerEx {
	
	@Inject
	private BoardDao dao;
	
	@Inject
	private ReplyAjaxDao ajaxDao;
	
	@RequestMapping(value="ajaxMessage.do")
	   public String restMessageAction() {
	      return "HelloRestController";
	   }
	   
	   @RequestMapping(value="ajaxAlert.do")
	   public String restMessageAction2() {
	      return "<script>function fun(){alert('Hello')}</script>";
	   }
	   @RequestMapping(value="ajaxJson.do")
	   public ScrapVO restMessageAction3() {      
	      return new ScrapVO(1,"blue","10");
	   }
	   @RequestMapping(value="studentList.do")
	   public List<StudentVO> studentListAction() {
		   return dao.selectStudentAction();
	   }
	   @RequestMapping(value="studentList2.do")
	   public List<HashMap<String, Object>> studentListAction2() {
		   return dao.selectStudentAction2();
	   }
	   
	   @RequestMapping(value="Emplist.do")
	   public List<HashMap<String, Object>> emplistAction(){
		   ArrayList<HashMap<String, Object>>list=new ArrayList<HashMap<String,Object>>();
		   HashMap<String,Object>map=new HashMap<String, Object>();
		   map.put("empno", 7878);
		   map.put("ename", "smith");
		   map.put("sal", 5000);
		   list.add(map);
		   return list;
	   }
	   
	   @PostMapping(value="DeptInfo.do")
	   public HashMap<String, Object>deptInfoAction(int no){
	      System.out.println("no="+no);
	      HashMap<String, Object>map=new HashMap<String, Object>();
	      map.put("deptno",10);
	      map.put("dname","영업부");
	      map.put("loc","부산");      
	      return map;
	   }
	   
	   //reply에서 로그인 일치여부 처리
	   @PostMapping(value="ajaxLogin.do")
	   public String ajaxLoginAction(String id, String pw, HttpSession session) {
		  boolean state=dao.loginCheck(id, pw);
		  if(state) {
			  session.setAttribute("id", id);
			  session.setMaxInactiveInterval(600);
			  return "success";
		  }
		   return "fail";
	   }
	   
	   
	   
	   //DB에 댓글 정보 입력
	   @RequestMapping(value="ajaxReplyInsert.do")
	   public List<ReplyVO> ajaxInsertList(ReplyVO vo) {
		   vo.setNo(ajaxDao.getAjaxSequence());
		   System.out.println(vo);
		   if(vo.getJob().equals("new")) {
			   vo.setPnum(vo.getNo());
			   vo.setRef(vo.getNo());
		   }
		   System.out.println(vo);
		   ajaxDao.insertAjaxReply(vo);
		   return ajaxDao.selectAjaxReply();
	   }
	   
	   @RequestMapping(value="ajaxDelete.do")
	   public List<ReplyVO> ajaxDeleteList(int no){
		   System.out.println(no);
		   ajaxDao.deleteAjaxReply(no);
		   return ajaxDao.selectAjaxReply();
	   }
	   
}
