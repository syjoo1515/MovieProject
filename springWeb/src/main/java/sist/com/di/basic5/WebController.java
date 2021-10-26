package sist.com.di.basic5;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Component;

@Component
public class WebController {
	
	
	//���� �������� ��� Inject, Autowired �ȵ�-�ƴ� @Qualifier ���̽����. resource�� �� �� name�����ؾ���
	//@Resource(name="action2")
	@Inject
	@Qualifier(value="q2")
	private ActionMessage actionMessage;

	
/*	@Autowired
	//�����ڿ��� @Autowired�� �����ϰ� @Qualifier ���Ұ�- ������ �������̸� �����ڿ��� Autowired �����°�
	public WebController(ActionMessage actionMessage) {
		super();
		this.actionMessage = actionMessage;
	}*/

	public ActionMessage getActionMessage() {
		return actionMessage;
	}

	//����� �������� �ҷ���
	@Inject //�ڵ����� ��- ���� �����Ͱ� �������� @Qualifier ������ ������ (�ƴ� @Resource����ϰų�)
	@Required //@Required: �޼ҵ忡���� ��밡��(����� ���Ұ�)
	public void setActionMessage(@Qualifier(value="q1")ActionMessage actionMessage) {
		this.actionMessage = actionMessage;
	}
	
	public void viewJs() {
		System.out.println("viewJs:"+actionMessage.getMessage()+" "+actionMessage.getCount());
	}

}
