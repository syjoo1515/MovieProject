package sist.com.di.basic3;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;


//기본값: 클래스 이름의 첫글자 소문자
//@Component: 의존성 주입할 때 <bean>의 역할과 같음
//이름 변경하려면 아래처럼
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
