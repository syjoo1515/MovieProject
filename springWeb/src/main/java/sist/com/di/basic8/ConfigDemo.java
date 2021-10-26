package sist.com.di.basic8;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
//xml ������ ���� Bean��ü�� �������� �ʰ� �ڹٷ� ���� ����ϴ� ���
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;

//@Configurable: Spring�� �� ��ü�� ������ �� �ʿ�� �ϴ� bean�� �������ش�
//@Configuration: �ش� Ŭ������ Bean ������ �� ���̶�� ���� ��Ÿ����. Bean ���� Ŭ������ �׻� �̰� �ٿ�����
@Configuration
//java ���� ������
@Import(value=ConfigMan.class)
//������ ���� ������
@ImportResource(value= {"/sist/com/di/basic/personDi.xml","/sist/com/di/basic2/Book.xml"})
@ComponentScan(basePackages="sist.com.di.basic8")
public class ConfigDemo {
	
	//������ ������ �̷������� ���� ����
	@Inject
	private DiProcess diprocess;
	

	//�����ڷ� inject
	//bean���� ����
	@Bean(name="getComputer")
	public Computer getComputer() {
	return new Computer("intel", "samsung", "ndbi", 5000);
}
	
	//get���� inject
	@Bean
	public Computer getComputerSuper() {
		Computer computer=new Computer();
		computer.setCpu("tsmc");
		computer.setMaker("sambo");
		computer.setGraphicCard("gc");
		computer.setPrice(7000);
		return computer;
	}
	
	@Bean
	public KeyBoard getKeyBoard() {
		return new KeyBoard("logi", 8000);
	}
	
	@Bean
	public SystemNode getSystemNode() {
		diprocess.process();
		return new SystemNode(getComputer(), getKeyBoard());
	}

}
