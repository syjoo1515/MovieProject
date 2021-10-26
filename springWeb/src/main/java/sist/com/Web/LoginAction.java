package sist.com.Web;

import org.springframework.stereotype.Component;

//자동으로 싱글톤으로 만들어줌
@Component
public class LoginAction {
	
	public boolean loginCheckAction(String id, String password) {
		return id.equals("Admin")&&password.equals("1234");
	}

}
