package sist.com.di.basic3;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value="prototype")
public class OracleSystem implements DataBaseSystem{
	
	//@PostConstruct: ������ �������� �ڵ� ȣ���
	@PostConstruct
	public void initDatabase() {
		System.out.println("OracleSystem initDatabase");
	}

	@Override
	public void connect() {
		System.out.println("OracleSystem connect");
		
	}

	@Override
	public void find() {
		System.out.println("OracleSystem find");
		
	}

	@Override
	public void result() {
		System.out.println("OracleSystem result");
		
	}
	
	

}
