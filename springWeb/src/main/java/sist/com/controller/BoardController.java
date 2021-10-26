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

@Controller //command�� ���� ��û�� ó���ϴ� ��
public class BoardController {
	
	//BoardDao ����
	@Autowired
	private BoardDao dao;
	
	@Inject
	private ReplyAjaxDao ajaxDao;
	
	//method: �޴� ���. signin.jsp���� ���� ��İ� �ٸ��� 405������
	//@RequestMapping(value="/boardMVC/boardLogin.do",method= {RequestMethod.GET,RequestMethod.POST})
	//@GetMapping //get������� �������� ���� �� ����
	//sigin���� �α��� �� board�� �Ѿ
/*	@PostMapping
	public String logCheck(String id, String password) {
		//System.out.println(id+" "+password);
		if(dao.loginCheck(id, password)) {
			return "redirect:boardList.do";
		}else {
			return "redirect:signin.jsp";
		}
	}*/
	
	//�α������� session���� ���� ���� �ٲ�-�ٵ� �� ���� �������� ó���ϴ°���
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
	
	//�α��� �����ϸ� ����� �Ѿ�ͼ� boardȭ�� ��µ�
	@RequestMapping(value="/boardMVC/boardList.do")
	public String BoardListAction(Model model) {
		model.addAttribute("boardMVC",dao.selectBoard());
		//���⼭ session�� �����ϰ� redirect�� ������ �ȵǳ�
		return "boardMVC/board";
	}
	
	//write���� Ȯ�� ������ �ش� ���� DB�� ����ǰ� boardȭ������ �̵�
	@PostMapping(value="/boardMVC/boardInsert.do")
	//�Һ�ũ�� tostring ������� ������ �˾Ƽ� �� ����
	public String boardInsertAction(MvcBoardVo bean, Model model, @RequestParam(value="file",required=false)MultipartFile file) {
		//DB�� �� ����
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
		//�������� ������� Ȯ���ϰ� ������ ��� ref, pnum ������ ��ȣ�� �°� �Է�
		bean.setNo(dao.getSequence());
		if(bean.getJob().equals("new")) {
			bean.setRef(bean.getNo());
			bean.setPnum(bean.getNo());
		}else if(bean.getJob().equals("reply")) {
			//HashMap�� job, pnum �־ sql�� ������ ���� �̰� �������/ ����̸� +1, �ƴϸ� -1
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
		//���⼭ dispatcher�� �����ϱ�(boardMVC/board) board�� �Ѿ�µ��� �ּҰ��� /boardMVC/boardInsert.do����-redirect�� ������ �ּҰ� board�� ������ (���߿� Ȯ���ϱ�)
		return "redirect:boardList.do";
	}
	


	
	//board���� �� Ŭ�� �� info�� �Ѿ, �߰��� ��ο������� url�� boardMVC���� �ٲ�
	@RequestMapping(value="/boardMVC/boardInfo.do")
	public String boardInfoAction(int no, Model model, String job) {
		//dao.boardInfo(no);
		//�� Ŭ���� hit�ö󰡵���
		model.addAttribute("info",dao.boardInfo(no));
		//passConfirmAction���� job�� modify�� �Ѿ�� ��� modify�� �̵��ϰ���
		if(job.equals("info")) {
			dao.updateHit(no);
			return "boardMVC/info";			
		}else {
			return "boardMVC/modify";			
		}
	}
	
	//mypage��ư Ŭ�� ��-���� redirect�� �Ѱܾ���
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
	
	
	
	
	//����/���� ��ư Ŭ�� �� ��й�ȣ�� ��ġ�ϴ��� Ȯ��
	@PostMapping(value="/passWordConfirm.do") 
	public String passConfirmAction(String job, String cp, int no) {
		//db�� ����� �н����� ������
		String dbpass=dao.getPassWord(no);
		
		return dbpass!=null&&dbpass.equals(cp)?job.equals("del")?"redirect:deleteBoard.do?no="+no:"redirect:/boardMVC/boardInfo.do?no="+no+"&job=modify"
				:"redirect:/boardMVC/password.jsp?job="+job+"&no="+no;
	}
	
	//�� ����+�� ������ reply���� �����ϰ�
	@RequestMapping(value="deleteBoard.do")
	public String deleteBoardAction(int no) {
		HashMap<String, Object>map=new HashMap<String, Object>();
	      map.put("job", "del");
	      map.put("pnum", dao.getParentNumber(no));
	      dao.updateReply(map);
	      dao.deleteBoard(no);
		return "redirect:boardMVC/boardList.do";
	}
	
	//���� �� form ���� �� �������� �Ѿ�ͼ� update�ϰ� boardInfoȭ������
	@PostMapping(value="modifyProcessAction.do") 
	public String modifyAction(MvcBoardVo vo) {
		System.out.println(vo);
		dao.updateBoard(vo);
		return "redirect:/boardMVC/boardInfo.do?no="+vo.getNo()+"&job=info";
	}
	
	//��ũ��
	@RequestMapping(value="boardMVC/scrap.do")
	public String scrapAction(String id,int no, Model model) {
		System.out.println(id+" "+no);
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("scrapno", no); 
		if(!dao.idCheckData(id)) { //���� ���̵� �ִ���
			dao.insertScrap(map);
		}else {
			ScrapVO v=new ScrapVO();
			v.setId(id);
			v.setScrapno(dao.getScrapNumber(id).concat("#").concat(String.valueOf(no)));
			dao.updateScrap(v);         
		}
		HashSet<String>set=new HashSet<String>();
		String []res=dao.getScrapNumber(id).split("#");
		//SCARAPNO�� ����� �� ��ȣ�� set�� ����
		for(String s:res) {
			set.add(s);
		}
		map.put("nos", set.toArray());
		model.addAttribute("selectMyPage", dao.selectMyPage(map));
		return "boardMVC/mypage";
	}
	
	//��𼭵� mypage������ ��ũ���� ���� ��������-�̺κ� �ٽ�Ȯ��
	@RequestMapping(value="boardMVC/myPage.do")
	public String myPageList(HttpSession session, Model model) {
		String id=(String)session.getAttribute("id");
		if(!dao.idCheckData(id)) {
			return "boardBVC/mypage";
		}
		HashSet<String>set=new HashSet<String>();
		HashMap<String, Object>map=new HashMap<String, Object>();
		String []res=dao.getScrapNumber(id).split("#");
		//SCARAPNO�� ����� �� ��ȣ�� set�� ����
		for(String s:res) {
			set.add(s);
		}
		map.put("nos", set.toArray());
		model.addAttribute("selectMyPage", dao.selectMyPage(map));
		return "boardMVC/mypage";
	}
	
	   //Spring ajax-reply���� �α��� ������ ���
	   @RequestMapping(value="replyView.do")
	   public String replyViewAction() {
		   
		   return "reply/replyView";
	   }
	
	

}
