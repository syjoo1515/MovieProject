package sist.com.di.basic2;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map.Entry;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class BookMain {
	
	public static void main(String[] args) {
		ApplicationContext context=new FileSystemXmlApplicationContext("src/main/java/sist/com/di/basic2/Book.xml");
		Store store=(Store)context.getBean("store1");
		//store1에서 list로 넣은 데이터들은 순서대로 모두 출력
		for(Book book: store.getList()) {
			System.out.println(book);
		}
		System.out.println("--------------------");
		//store1에서 set으로 넣은 데이터들은 중복 제거하고 출력
		Iterator<Book> it= store.getSet().iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println("-------------------");
		Iterator<Entry<Integer, Book>> ite= store.getMap().entrySet().iterator();
		for(;ite.hasNext();) {
			Entry<Integer, Book> entry=ite.next();
			System.out.println(entry.getKey()+" "+entry.getValue());
		}
		System.out.println("-------------------");
		System.out.println(store.getProperties().getProperty("1"));; //지정한 key값 넣어줌
		System.out.println(store.getProperties().get("2"));; //get, getProperty 모두 동일한 결과
		System.out.println(store.getProperties());; //모든결과 출력, 순서는 무작위(property는 map구조라서)
		
		System.out.println("-------------------");
		Enumeration<Object> e =store.getProperties().keys();
		while(e.hasMoreElements()) {
			String key=(String)e.nextElement();
			System.out.println(key+" "+store.getProperties().get(key));
		}
	
	
	}

}
