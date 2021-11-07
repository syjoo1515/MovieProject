package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO{
	private String id;
	private String movieCd;
	private String title;
	private String grade;
	private String contents;
	private String regdate;
	private String username;
	private String movieNm;

}
