package sist.com.di.basic;

public class Person {
	private String name;
	private int age;
	private String address;

	public Person() {
		System.out.println("Person()");
	}

	public Person(String name, int age, String address) {
		super();
		System.out.println("Person(String name, int age, String address)");
		this.name = name;
		this.age = age;
		this.address = address;
	}
	
	//init: 생성자 다음으로 호출되는 메소드 - bean생성할 때 설정가능
	public void initPerson() {
		System.out.println("initPerson");
	}
	
	//init끝나고 호출하는 메소드
	public void destroyPerson() {
		System.out.println("destroyPerson");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", address=" + address + "]";
	}
	
	

}
