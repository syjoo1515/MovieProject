package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeVO{
	private String id;
	private String movieCd;
	private String regdate;
	private String movieNm;

}
