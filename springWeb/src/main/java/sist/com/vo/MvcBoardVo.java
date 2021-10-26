package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MvcBoardVo {
	private int no;
	private String author;
	private String title;
	private String password;
	private String contents;
	private int hit;
	private int ref;
	private int step;
	private int lev;
	private int pnum;
	private int reply;
	private String regdate;
	private String fileName;
	private String id;
	private String job;
	

}
