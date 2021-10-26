package sist.com.di.basic4;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component(value="oracleDbms")
@Scope("singleton")
public class Dbms {
	@Value("localhost:1521:orcl")
	private String url;
	@Value("apple")
	private String accout;
	@Value("500")
	private int connect;
	@Value("-1")
	private int waitTime;
	
	//객체 생성 후 자동 호출
	@PostConstruct
	public void connect() {
		System.out.println("connect...");
	}
	
	@Override
	public String toString() {
		return "Dbms [url=" + url + ", accout=" + accout + ", connect=" + connect + ", waitTime=" + waitTime + "]";
	}
	
	

}
