package sist.com.di.basic6;

import org.springframework.stereotype.Component;

@Component
public class MessageColor {
	
	public String getColorMessage(String id) {
		String message=null;
		if(id.equals("blue")) {
			message="blue~";
		}
		if(id.equals("red")) {
			message="red~";
		}
		if(id.equals("green")) {
			message="green~";
		}
		if(id.equals("cyan")) {
			message="cyan~";
		}
		return message;
	}

}
