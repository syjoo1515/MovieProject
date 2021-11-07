package sist.com.webProject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.UserDao;
import sist.com.vo.UserVO;

@RestController
public class UserRestController{

	@Autowired
	private UserDao dao;

	//로그인시 쿠키 있는지 여부 확인
		@RequestMapping(value="/movieProject/loginRemember.do")
		public String loginRemember(HttpServletRequest request, HttpServletResponse response) {
			Cookie[] cookie=request.getCookies();
			String id="";
			if(cookie!=null) {
				for(int i=0;i<cookie.length;i++) {
					if(cookie[i].getName().equals("remember")) {
						id=cookie[i].getValue();
					}
				}
			}
		return id;	
		}
		
		//회원가입시 id 중복체크
		@RequestMapping(value="/movieProject/idCheck.do")
		public String idCheck(String id) {
			if(dao.idCheck(id)) return "true";
			else return "false";
		}
		
		//id로 회원 정보 가져오기 (mypage에 출력)
		@RequestMapping(value="/movieProject/userInfo.do")
		public UserVO userInfo(String id){
			return dao.userInfo(id);
			
		}

}
