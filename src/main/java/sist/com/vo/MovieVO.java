package sist.com.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
}
