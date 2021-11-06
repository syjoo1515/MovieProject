package sist.com.webProject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.MainDao;
import sist.com.vo.MovieVO;

@RestController
public class MovieApiParsing{

@Autowired
private MainDao dao;

	String json;
	
	@RequestMapping(value="/bootstrap/apiAction.do")
	public void WebConnection() throws Exception{
			//웹에서 데이터 가져오기
			
		
			BufferedReader br;
			URL url;
			HttpURLConnection conn;
			String protocol = "GET";
			
			JSONParser parser = new JSONParser();
			
			List<MovieVO> list=new ArrayList<MovieVO>(); //여러개의 row가 담길 datalist
			Map<String, Object> insertMap= new HashMap<String, Object>(); //msybatis에 던질 map
			
			for (int j = 820; j <847 ; j++) {
			String address="http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12ff9134153dd158e068074390244746&itemPerPage=100&curPage="+j;
			url = new URL(address);
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod(protocol);
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			json = br.readLine();
			//테스트출력
			//System.out.println(json);
			
			
			JSONObject obj = (JSONObject)parser.parse(json);
			JSONObject movieListResult = (JSONObject)obj.get("movieListResult");
			//System.out.println(movieListResult);
			JSONArray movieList= (JSONArray)movieListResult.get("movieList");
			//System.out.println(movieList);
			
			
			for (int i = 0; i < movieList.size(); i++) {
				JSONObject tmp = (JSONObject)movieList.get(i);
				String movieCd=(String)tmp.get("movieCd");
				String movieNm=(String)tmp.get("movieNm");
				String prdtYear=(String)tmp.get("prdtYear");
				String openDt=(String)tmp.get("openDt");
				String typeNm=(String)tmp.get("typeNm");
				String nationAlt=(String)tmp.get("nationAlt");
				String genreAlt=(String)tmp.get("genreAlt");
				String peopleNm = "";
				if(!((JSONArray)tmp.get("directors")).isEmpty()) {
					peopleNm=(String)((JSONObject)((JSONArray)tmp.get("directors")).get(0)).get("peopleNm");
				}

				
				MovieVO vo=new MovieVO();
				vo.setMovieCd(movieCd);
				vo.setMovieNm(movieNm);
				vo.setPrdtYear(prdtYear);
				vo.setOpenDt(openDt);
				vo.setTypeNm(typeNm);
				vo.setNationAlt(nationAlt);
				vo.setGenreAlt(genreAlt);
				vo.setPeopleNm(peopleNm);

				
				list.add(vo);
			}//for
			}
			
			insertMap.put("list", list);  //mybatis의 foreach의 collection이름을 key로
			dao.insertMoiveData(insertMap);
	}
	

	
}

