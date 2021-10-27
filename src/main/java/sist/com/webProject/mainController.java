package sist.com.webProject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sist.com.dao.mainDao;

@Controller
public class mainController {
	
	@Autowired
	private mainDao dao;
	
	@RequestMapping(value="/bootstrap/loginAction.do")
	public String loginAction(HttpSession session, HttpServletRequest request) {
		boolean state=dao.loginCheck(request.getParameter("id"), request.getParameter("password"));
		if(state) return "redirect: boxOffice.jsp";
		else return "redirect: login.jsp";
	}

}
