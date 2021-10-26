package sist.com.di.basic4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//myBatis°´Ã¼ ÀÇÁ¸
@Component
public class Dao {
	
	@Autowired
	private SqlSessionFactoryBean bean;

	public SqlSessionFactoryBean getBean() {
		return bean;
	}

	public void setBean(SqlSessionFactoryBean bean) {
		this.bean = bean;
	}
	
	public void select() {
		System.out.println(bean.toString()+"Select");
	}
	
	

}
