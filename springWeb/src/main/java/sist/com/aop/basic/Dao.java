package sist.com.aop.basic;

public interface Dao {
	//핵심코드 - 일반적으로 DB에 연결되어서, 사용 후 연결을 끊는 방식으로 사용함
	public void appInsert(int cnt);
	public void appUpdate(double d);
	public void appDelete();
}
