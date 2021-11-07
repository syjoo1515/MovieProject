package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieVO{
	private String movieCd;
	private String movieNm ;
	private String prdtYear ;
	private String openDt ;
	private String typeNm ;
	private String nationAlt ;
	private String genreAlt ;
	private String peopleNm  ;
	
	private String poster;
	private String discrip;
	
	private String movieNmEn;
	private String showTm;
	private String actorsNm;
	private String watchGradeNm;
}
