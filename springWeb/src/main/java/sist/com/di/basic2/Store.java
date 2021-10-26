package sist.com.di.basic2;

import java.util.*;

public class Store {
	//store: List, Set, Map, Properties ÀÇÁ¸
	private List<Book> list;
	private Set<Book> set;
	private Map<Integer, Book> map;
	private Properties properties;
	
	
	
	public Store(List<Book> list, Set<Book> set, Map<Integer, Book> map, Properties properties) {
		this.list = list;
		this.set = set;
		this.map = map;
		this.properties = properties;
	}
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<Book> getList() {
		return list;
	}
	public void setList(List<Book> list) {
		this.list = list;
	}
	public Set<Book> getSet() {
		return set;
	}
	public void setSet(Set<Book> set) {
		this.set = set;
	}
	public Map<Integer, Book> getMap() {
		return map;
	}
	public void setMap(Map<Integer, Book> map) {
		this.map = map;
	}
	public Properties getProperties() {
		return properties;
	}
	public void setProperties(Properties properties) {
		this.properties = properties;
	}
	
	


}
