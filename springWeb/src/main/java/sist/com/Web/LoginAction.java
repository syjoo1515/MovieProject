package sist.com.Web;

import org.springframework.stereotype.Component;

//�ڵ����� �̱������� �������
@Component
public class LoginAction {
	
	public boolean loginCheckAction(String id, String password) {
		return id.equals("Admin")&&password.equals("1234");
	}

}
