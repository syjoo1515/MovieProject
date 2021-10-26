package sist.com.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.HashSet;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import sist.com.dao.BoardDao;
import sist.com.dao.ReplyAjaxDao;
import sist.com.vo.MvcBoardVo;
import sist.com.vo.ScrapVO;

@Controller //command에 대한 요청을 처리하는 곳
public class BoardController {
	
	//BoardDao 의존
	@Autowired
	private BoardDao dao;
	
	@Inject
	private ReplyAjaxDao ajaxDao;
	
	//method: 받는 방법. signin.jsp에서 보낸 방식과 다르면 405에러남
	//@RequestMapping(value="/boardMVC/boardLogin.do",method= {RequestMethod.GET,RequestMethod.POST})
	//@GetMapping //get방식으로 보낼때만 받을 수 있음
	//sigin에서 로그인 시 board로 넘어감
/*	@PostMapping
	public String logCheck(String id, String password) {
		//System.out.println(id+" "+password);
		if(dao.loginCheck(id, password)) {
			return "redirect:boardList.do";
		}else {
			return "redirect:signin.jsp";
		}
	}*/
	
	//로그인정보 session으로 쓰기 위해 바꿈-근데 왜 굳이 세션으로 처리하는거지
	@PostMapping(value="/boardMVC/boardLogin.do")
	   public String logCheck(HttpSession session,HttpServletRequest request) {   
	      boolean state=dao.loginCheck(request.getParameter("id"),request.getParameter("password"));
	      if(state) {
	         session.setAttribute("id", request.getParameter("id"));
	         session.setAttribute("password", request.getParameter("password"));
	         session.setMaxInactiveInterval(60);
	      }
	      return state?"redirect:boardList.do":"redirect:signin.jsp";
	   }
	
	//로그인 성공하면 여기로 넘어와서 board화면 출력됨
	@RequestMapping(value="/boardMVC/boardList.do")
	public String BoardListAction(Model model) {
		model.addAttribute("boardMVC",dao.selectBoard());
		//여기서 session에 저장하고 redirect로 보내면 안되나
		return "boardMVC/board";
	}
	
	//write에서 확인 누르면 해당 값들 DB에 저장되고 board화면으로 이동
	@PostMapping(value="/boardMVC/boardInsert.do")
	//롬보크로 tostring 만들었기 때문에 알아서 잘 나옴
	public String boardInsertAction(MvcBoardVo bean, Model model, @RequestParam(value="file",required=false)MultipartFile file) {
		//DB에 값 저장
		//System.out.println(dao.selectBoard());
		String location="C:\\Users\\82106\\SpringLesson2\\springWeb\\src\\main\\webapp\\upload\\";
		FileOutputStream fos=null;
		String fileName=file.getOriginalFilename();
		if(fileName.length()>0) {
			try {
				fos=new FileOutputStream(location.concat(fileName));
				fos.write(file.getBytes());
				bean.setFileName(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(fos!=null)fos.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
		//새글인지 답글인지 확인하고 새글일 경우 ref, pnum 시퀸스 번호에 맞게 입력
		bean.setNo(dao.getSequence());
		if(bean.getJob().equals("new")) {
			bean.setRef(bean.getNo());
			bean.setPnum(bean.getNo());
		}else if(bean.getJob().equals("reply")) {
			//HashMap에 job, pnum 넣어서 sql에 전달한 다음 이게 답글인지/ 답글이면 +1, 아니면 -1
			HashMap<String, Object>map=new HashMap<String, Object>();
			map.put("job",bean.getJob());
			map.put("pnum", bean.getPnum());
			map.put("ref", bean.getRef());
			map.put("step", bean.getStep());
			dao.updateReply(map);
			dao.updateStep(map);
			bean.setStep(bean.getStep()+1);
			bean.setLev(bean.getLev()+1);
		}
		
		System.out.println(bean);
		dao.insertBoard(bean);

		model.addAttribute("boardMVC",dao.selectBoard());
		//여기서 dispatcher로 보내니까(boardMVC/board) board로 넘어갔는데도 주소값이 /boardMVC/boardInsert.do나옴-redirect로 보내서 주소값 board로 가게함 (나중에 확인하기)
		return "redirect:boardList.do";
	}
	


	
	//board에서 글 클릭 시 info로 넘어감, 중간에 경로에러나서 url다 boardMVC들어가게 바꿈
	@RequestMapping(value="/boardMVC/boardInfo.do")
	public String boardInfoAction(int no, Model model, String job) {
		//dao.boardInfo(no);
		//글 클릭시 hit올라가도록
		model.addAttribute("info",dao.boardInfo(no));
		//passConfirmAction에서 job이 modify로 넘어올 경우 modify로 이동하게함
		if(job.equals("info")) {
			dao.updateHit(no);
			return "boardMVC/info";			
		}else {
			return "boardMVC/modify";			
		}
	}
	
	//mypage버튼 클릭 시-여긴 redirect로 넘겨야함
	@RequestMapping(value="/boardMVC/mypageAcion.do")
	public String myPageAction(HttpSession session,HttpServletRequest request) {
		String id=(String) session.getAttribute("id");
		String password=(String)session.getAttribute("password");
		if(id==null||password==null) {
			return "redirect:signin.jsp";			
		}else {
		boolean state=dao.loginCheck(id, password);
		if(state) {
			return "redirect:mypage.jsp";
		}else
			return "redirect:signin.jsp";	
		}
		
	}
	
	
	
	
	//수정/삭제 버튼 클릭 시 비밀번호가 일치하는지 확인
	@PostMapping(value="/passWordConfirm.do") 
	public String passConfirmAction(String job, String cp, int no) {
		//db에 저장된 패스워드 가져옴
		String dbpass=dao.getPassWord(no);
		
		return dbpass!=null&&dbpass.equals(cp)?job.equals("del")?"redirect:deleteBoard.do?no="+no:"redirect:/boardMVC/boardInfo.do?no="+no+"&job=modify"
				:"redirect:/boardMVC/password.jsp?job="+job+"&no="+no;
	}
	
	//글 삭제+글 삭제시 reply수도 감소하게
	@RequestMapping(value="deleteBoard.do")
	public String deleteBoardAction(int no) {
		HashMap<String, Object>map=new HashMap<String, Object>();
	      map.put("job", "del");
	      map.put("pnum", dao.getParentNumber(no));
	      dao.updateReply(map);
	      dao.deleteBoard(no);
		return "redirect:boardMVC/boardList.do";
	}
	
	//수정 후 form 제출 시 이쪽으로 넘어와서 update하고 boardInfo화면으로
	@PostMapping(value="modifyProcessAction.do") 
	public String modifyAction(MvcBoardVo vo) {
		System.out.println(vo);
		dao.updateBoard(vo);
		return "redirect:/boardMVC/boardInfo.do?no="+vo.getNo()+"&job=info";
	}
	
	//스크랩
	@RequestMapping(value="boardMVC/scrap.do")
	public String scrapAction(String id,int no, Model model) {
		System.out.println(id+" "+no);
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("scrapno", no); 
		if(!dao.idCheckData(id)) { //실제 아이디가 있는지
			dao.insertScrap(map);
		}else {
			ScrapVO v=new ScrapVO();
			v.setId(id);
			v.setScrapno(dao.getScrapNumber(id).concat("#").concat(String.valueOf(no)));
			dao.updateScrap(v);         
		}
		HashSet<String>set=new HashSet<String>();
		String []res=dao.getScrapNumber(id).split("#");
		//SCARAPNO에 저장된 글 번호들 set에 저장
		for(String s:res) {
			set.add(s);
		}
		map.put("nos", set.toArray());
		model.addAttribute("selectMyPage", dao.selectMyPage(map));
		return "boardMVC/mypage";
	}
	
	//어디서든 mypage누르면 스크랩한 내용 나오도록-이부분 다시확인
	@RequestMapping(value="boardMVC/myPage.do")
	public String myPageList(HttpSession session, Model model) {
		String id=(String)session.getAttribute("id");
		if(!dao.idCheckData(id)) {
			return "boardBVC/mypage";
		}
		HashSet<String>set=new HashSet<String>();
		HashMap<String, Object>map=new HashMap<String, Object>();
		String []res=dao.getScrapNumber(id).split("#");
		//SCARAPNO에 저장된 글 번호들 set에 저장
		for(String s:res) {
			set.add(s);
		}
		map.put("nos", set.toArray());
		model.addAttribute("selectMyPage", dao.selectMyPage(map));
		return "boardMVC/mypage";
	}
	
	   //Spring ajax-reply에서 로그인 성공한 경우
	   @RequestMapping(value="replyView.do")
	   public String replyViewAction() {
		   
		   return "reply/replyView";
	   }
	
	

}
