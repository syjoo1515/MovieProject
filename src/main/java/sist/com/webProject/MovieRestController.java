package sist.com.webProject;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.MovieDao;
import sist.com.vo.MovieVO;

@RestController
public class MovieRestController{

	@Autowired
	private MovieDao dao;
	
	//영화 포스터 췝 크롤링
		@RequestMapping(value="movieImg.do")
		public HashMap<String, String> activateBot(String moviecode) {
			WebDriver driver;
			WebElement element;
			String url;
			String WEB_DRIVER_ID = "webdriver.chrome.driver";
			String WEB_DRIVER_PATH = "C:/chromedriver/chromedriver.exe";
			
			// WebDriver 경로 설정
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
			 
			// WebDriver 옵션 설정
			ChromeOptions options = new ChromeOptions();
			options.addArguments("--disable-popup-blocking");
			options.addArguments("headless");
			 
			driver = new ChromeDriver(options);
			 
			url = "https://kobis.or.kr/kobis/business/mast/mvie/searchMovieList.do?dtTp=movie&dtCd="+moviecode;
			try {
				driver.get(url);
	 
				
				Thread.sleep(2000);
	 
				// 이미지 src 파싱
				element = driver.findElement(By.xpath("//*[@id=\"ui-id-1\"]/div/div[1]/div[2]/a/img"));
				String Img = element.getAttribute("src");
				//*[@id="ui-id-1"]/div/div[1]/div[2]/a/img
				//*[@id="ui-id-5"]/div/div[1]/div[4]/p
				//*[@id="ui-id-7"]/div/div[1]/div[5]/p
				element=driver.findElement(By.className("desc_info"));
				String discrip=element.getAttribute("innerHTML");
				HashMap<String, String> map=new HashMap<>();
				map.put("movieImg", Img);
				map.put("movieDiscrip", discrip);
				return map;
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			} finally {
				driver.close();
				driver.quit();
			}
		}
		
		
		//영화명 검색시 DB에서 찾기 - poster, 내용정보도 리턴
		@RequestMapping(value="/movieProject/searchMovie.do")
		public List<MovieVO> searchMovie(HttpServletRequest request) throws Exception {
			String movie =URLDecoder.decode(request.getParameter("title"), "utf-8");
			//System.out.println(title);
			//System.out.println(dao.searchMovie(title));
			return dao.searchMovie(movie);
		}
		
		//감독명으로 검색시
		@RequestMapping(value="/movieProject/searchDirector.do")
		public List<MovieVO> searchDirector(HttpServletRequest request)throws Exception{
			String director =URLDecoder.decode(request.getParameter("title"), "utf-8");
			return dao.searchDirector(director);
		}
		
		//배우명으로 검색시
		@RequestMapping(value="/movieProject/searchActor.do")
		public List<MovieVO> searchActor(HttpServletRequest request)throws Exception{
			String actor =URLDecoder.decode(request.getParameter("title"), "utf-8");
			return dao.searchActor(actor);
		}
 		
		
		//영화코드 가져오기(이미지 크롤링용)
		@RequestMapping(value="/movieProject/movieCdSelect.do")
		public List<String> movieCdSelect() {
			return dao.movieCdSelect();
		}
		
		//DB에 크롤링한 영화 포스터, 내용 insert
		@RequestMapping(value="/movieProject/movieImgInsert.do")
		public String movieImgInsert(String moviecode, String movieImg, String movieDiscrip) {
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("moviecode", moviecode);
			map.put("movieImg", movieImg);
			map.put("movieDiscrip", movieDiscrip);
			dao.insertMovieImg(map);
			return "success";
		}
		
		//DB에 영화 상세정보 insert
		@RequestMapping(value="/movieProject/movieDetailInsert.do")
		public String movieDetailInsert(MovieVO vo) {
			dao.movieDetailInsert(vo);
			return "SUCCESS";
		}
		
		//영화 포스터, 내용 가져오기
		@RequestMapping(value="/movieProject/searchMovieByCd.do")
		public MovieVO searchMovieImg(String movieCd) {
			//System.out.println(dao.searchMovieImg(movieCd));
			return dao.searchMovieByCd(movieCd);
		}
	
	
}
