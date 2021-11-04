package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikeMovieVO{
	private String id;
	private String movieCd;
	private String regdate;
	private String movieNm;

}
