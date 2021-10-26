package sist.com.di.basic8;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
//xml 설정을 통해 Bean객체를 구현하지 않고 자바로 만들어서 사용하는 방식
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;

//@Configurable: Spring이 이 객체가 생성될 때 필요로 하는 bean을 주입해준다
//@Configuration: 해당 클래스가 Bean 설정을 할 것이라는 것을 나타낸다. Bean 설정 클래스는 항상 이걸 붙여야함
@Configuration
//java 파일 가져옴
@Import(value=ConfigMan.class)
//여러개 파일 가져옴
@ImportResource(value= {"/sist/com/di/basic/personDi.xml","/sist/com/di/basic2/Book.xml"})
@ComponentScan(basePackages="sist.com.di.basic8")
public class ConfigDemo {
	
	//개별로 의존성 이런식으로 주입 가능
	@Inject
	private DiProcess diprocess;
	

	//생성자로 inject
	//bean으로 만듦
	@Bean(name="getComputer")
	public Computer getComputer() {
	return new Computer("intel", "samsung", "ndbi", 5000);
}
	
	//get으로 inject
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
