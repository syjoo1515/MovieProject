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
	
	//init: ������ �������� ȣ��Ǵ� �޼ҵ� - bean������ �� ��������
	public void initPerson() {
		System.out.println("initPerson");
	}
	
	//init������ ȣ���ϴ� �޼ҵ�
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
