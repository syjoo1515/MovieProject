package sist.com.aop.basic3;

import org.springframework.stereotype.Component;

@Component
public class SearchImp implements Search{

	@Override
	public void fileSearch() {
		System.out.println("fileSearch");
		
	}

	@Override
	public void xmlParsing() {
		System.out.println("xmlParsing");
		
	}

	@Override
	public void domSaxAearch() {
		String str=null;
		str.concat(str); //에러코드
		System.out.println("domSaxAearch");
		
	}
	
	

}
