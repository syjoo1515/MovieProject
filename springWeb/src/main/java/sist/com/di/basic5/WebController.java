package sist.com.di.basic5;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Component;

@Component
public class WebController {
	
	
	//값이 여러개일 경우 Inject, Autowired 안됨-아님 @Qualifier 같이써야함. resource를 한 뒤 name지정해야함
	//@Resource(name="action2")
	@Inject
	@Qualifier(value="q2")
	private ActionMessage actionMessage;

	
/*	@Autowired
	//생성자에는 @Autowired만 가능하고 @Qualifier 사용불가- 데이터 여러개이면 생성자에서 Autowired 못쓰는것
	public WebController(ActionMessage actionMessage) {
		super();
		this.actionMessage = actionMessage;
	}*/

	public ActionMessage getActionMessage() {
		return actionMessage;
	}

	//선언부 다음으로 불러짐
	@Inject //자동으로 들어감- 현재 데이터가 여러개라 @Qualifier 없으면 에러남 (아님 @Resource사용하거나)
	@Required //@Required: 메소드에서만 사용가능(선언부 사용불가)
	public void setActionMessage(@Qualifier(value="q1")ActionMessage actionMessage) {
		this.actionMessage = actionMessage;
	}
	
	public void viewJs() {
		System.out.println("viewJs:"+actionMessage.getMessage()+" "+actionMessage.getCount());
	}

}
