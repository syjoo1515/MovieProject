package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	private int no;
	private String id;
	private String regdate;
	private int step, lev, pnum, ref, reply;
	private String job;
	private String contents;
	

}
