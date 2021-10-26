package sist.com.di.basic8;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

//@Configuration을 쓰면 ConfigDemo에서 import를 안해도 불어올 수 있음. 
//만약 Configuration안쓰면 ConfigDemo에서 import해줘야함
//@Configuration
//@ComponentScan(basePackages="sist.com.di.basic8")
public class ConfigMan {
	
	@Bean
	public Man getMan() {
		return new Man("가나다",25);
	}

}
