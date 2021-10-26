package sist.com.di.basic3;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;


//�⺻��: Ŭ���� �̸��� ù���� �ҹ���
//@Component: ������ ������ �� <bean>�� ���Ұ� ����
//�̸� �����Ϸ��� �Ʒ�ó��
@Component(value="Process")
public class SystemProcess {

	@Resource(name="oracleSystem")
	private DataBaseSystem dataBaseSystem;
	

	public DataBaseSystem getDataBaseSystem() {
		return dataBaseSystem;
	}

	@Resource(name="mySqlSystem")
	public void setDataBaseSystem(DataBaseSystem dataBaseSystem) {
		this.dataBaseSystem = dataBaseSystem;
	}
	
	

}
