package sist.com.di.basic8;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//@Configuration�� ���� ConfigDemo���� import�� ���ص� �Ҿ�� �� ����. 
//���� Configuration�Ⱦ��� ConfigDemo���� import�������
//@Configuration
//@ComponentScan(basePackages="sist.com.di.basic8")
public class ConfigMan {
	
	@Bean
	public Man getMan() {
		return new Man("������",25);
	}

}
