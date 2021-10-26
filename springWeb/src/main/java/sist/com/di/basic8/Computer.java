package sist.com.di.basic8;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

//@Bean a말고 @Component로도 호출할 수 있음
@Component
public class Computer {
	@Value("Oracle")
	private String cpu;
	private String maker;
	private String graphicCard;
	private int price;
	
	
	
	public Computer(String cpu, String maker, String graphicCard, int price) {
		this.cpu = cpu;
		this.maker = maker;
		this.graphicCard = graphicCard;
		this.price = price;
	}
	public Computer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getGraphicCard() {
		return graphicCard;
	}
	public void setGraphicCard(String graphicCard) {
		this.graphicCard = graphicCard;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Computer [cpu=" + cpu + ", maker=" + maker + ", graphicCard=" + graphicCard + ", price=" + price + "]";
	}
	
	
	
	

}
