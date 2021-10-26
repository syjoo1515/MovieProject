package sist.com.di.basic2;

public class Book {
	private String bookname;
	private int price;
	private String author;
	private String publisher;
	
	
	public Book() {
		super();
		System.out.println("Book()");
	}
	
	public Book(String bookname, int price, String author, String publisher) {
		this.bookname = bookname;
		this.price = price;
		this.author = author;
		this.publisher = publisher;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "book [bookname=" + bookname + ", price=" + price + ", author=" + author + ", publisher=" + publisher
				+ "]";
	}
	
	
	

}
