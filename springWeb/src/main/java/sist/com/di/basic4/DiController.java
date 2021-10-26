package sist.com.di.basic4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

//Dao¿«¡∏
@Component
public class DiController {
	
	@Autowired
	private Dao dao;
	
	public void selectDemo() {
		dao.select();
	}

}
