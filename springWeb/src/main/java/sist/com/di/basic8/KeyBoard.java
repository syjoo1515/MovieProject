package sist.com.di.basic8;

public class KeyBoard {
	private String maker;
	private int price;
	
	
	
	public KeyBoard(String maker, int price) {
		this.maker = maker;
		this.price = price;
	}
	public KeyBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "KeyBoard [maker=" + maker + ", price=" + price + "]";
	}
	
	

}
