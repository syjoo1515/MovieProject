package sist.com.di.basic5;

public class ActionMessage {
	private String message;
	private int count;
	
	

	public ActionMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ActionMessage(String message, int count) {
		this.message = message;
		this.count = count;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
