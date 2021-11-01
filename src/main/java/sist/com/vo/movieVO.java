package sist.com.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class movieVO{
	private int movieCd;
	private String movieNm ;
	private String movieNmEn ;
	private int prdtYear ;
	private int openDt ;
	private String typeNm ;
	private String nationAlt ;
	private String genreAlt ;
	private String repNationNm  ;
	private String repGenreNm  ;
	//private int peopleNm  ;
}
