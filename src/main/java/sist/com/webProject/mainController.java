package sist.com.webProject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sist.com.dao.mainDao;
import sist.com.vo.userVO;

@Controller
public class mainController {
	
	@Autowired
	private mainDao dao;
	
	//로그인/회원가입 버튼 클릭 시 세션에 저장된 정보가 있는지 확인해서 로그인 또는 마이페이지로 이동
	@RequestMapping(value="/bootstrap/loginCheck.do")
	public String myPage(HttpSession session, HttpServletRequest request) {
		String id=(String)session.getAttribute("id");
		String password=(String)session.getAttribute("password");
		if(id==null||password==null) {
			return "redirect:login.jsp";
		}else {
			boolean state=dao.loginCheck(id, password);
			if(state) {
				return "redirect: mypage.jsp";
			}else {
				return "redirect: login.jsp";
			}
		}
	}
	
	//로그인 구현. 세션에 로그인 정보를 저장하고, remember me 버튼 클릭 시 쿠키에 데이터 저장한다.
	@RequestMapping(value="/bootstrap/loginAction.do")
	public String loginAction(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		boolean state=dao.loginCheck(request.getParameter("id"), request.getParameter("password"));
		//쿠키생성
		Cookie cookie=new Cookie("remember",request.getParameter("id"));
		String remember=request.getParameter("remember");
		if(remember!=null) {
			cookie.setMaxAge(60*60); 
		}else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie); //쿠키를 심어줌
		//세션생성
		if(state) {
			session.setAttribute("id", request.getParameter("id"));
			session.setAttribute("password", request.getParameter("password"));
			session.setMaxInactiveInterval(60); //세션 60초로 설정-로그인하고 60초동안 움직임 없으면 로그인 풀림
			return "redirect: mypage.jsp";
		}
		else return "redirect: login.jsp";
	}

	//회원가입 구현
	@RequestMapping(value="/bootstrap/joinAction.do")
	public String joinAction(userVO user) {
		int no=dao.getSequence();
		user.setNo(no);
		dao.joinAction(user);
		System.out.println(user);
		return "redirect:login.jsp";
	}
	
	
	
	
	//로그아웃시 세션 삭제 후 로그인 페이지로 이동
	@RequestMapping(value="/bootstrap/logoutAction.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.jsp";
	}
	
	
	

	

}
