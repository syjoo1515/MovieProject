package sist.com.di.basic4;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//myBatic��ü-DB�� ����������
@Component
public class SqlSessionFactoryBean {
	
/*	//�ڵ�����.SqlSessionFactoryBean�� �ϳ��̸鼭 Dbms��ü�� �Ѱ��� ��� @Autowired/@Inject����ϸ� �ڵ����� ���δ�
	@Autowired
	@Inject*/
	
	//Dbms��ü�� �������� ��� @Resource ���
	@Resource(name="oracleDbms")
	private Dbms dbms;

	@Override
	public String toString() {
		return "SqlSessionFactoryBean [dbms=" + dbms + "]";
	}
	
	

}
