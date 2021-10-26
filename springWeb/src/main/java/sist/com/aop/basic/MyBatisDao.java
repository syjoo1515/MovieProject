package sist.com.aop.basic;


public class MyBatisDao implements Dao{
	//ÇÙ½É±â´É

	@Override
	public void appInsert(int data){
		System.out.println("appInsert");
	}

	@Override
	public void appUpdate(double d) {
		System.out.println("appUpdate");
	}

	@Override
	public void appDelete() {
		int rs=5/0;
		System.out.println("appDelete");
	}

	
}
