package sist.com.webProject;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.core.internal.filesystem.local.Convert;
import org.json.simple.JSONArray;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.mainDao;
import sist.com.vo.LikeMovieVO;
import sist.com.vo.MoviePosterVO;
import sist.com.vo.movieVO;
import sist.com.vo.userVO;

@RestController
public class restController {
	
	@Autowired
	private mainDao dao;
	
	
 
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
	
	
	//로그인시 쿠키 있는지 여부 확인
	@RequestMapping(value="/bootstrap/loginRemember.do")
	public String loginRemember(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookie=request.getCookies();
		String id="";
		if(cookie!=null) {
			for(int i=0;i<cookie.length;i++) {
				if(cookie[i].getName().equals("remember")) {
					id=cookie[i].getValue();
				}
			}
		}
	return id;	
	}
	
	//회원가입시 id 중복체크
	@RequestMapping(value="/bootstrap/idCheck.do")
	public String idCheck(String id) {
		if(dao.idCheck(id)) return "true";
		else return "false";
	}
	
	//id로 회원 정보 가져오기 (mypage에 출력)
	@RequestMapping(value="/bootstrap/userInfo.do")
	public userVO userInfo(String id){
		userVO vo= new userVO();
		vo=dao.userInfo(id);
		return vo;
	}
	
	//영화 검색시 DB에서 찾기 - poster, 내용정보도 리턴
	@RequestMapping(value="/bootstrap/searchMovie.do")
	public List<MoviePosterVO> searchMovie(HttpServletRequest request) throws Exception {
		String title =URLDecoder.decode(request.getParameter("title"), "utf-8");
		//System.out.println(title);
		//System.out.println(dao.searchMovie(title));
		return dao.searchMovie(title);
	}
	
	//영화코드 가져오기(이미지 크롤링용)
	@RequestMapping(value="/bootstrap/movieCdSelect.do")
	public List<String> movieCdSelect() {
		return dao.movieCdSelect();
	}
	
	//DB에 크롤링한 영화 포스터, 내용 insert
	@RequestMapping(value="/bootstrap/movieImgInsert.do")
	public String movieImgInsert(String moviecode, String movieImg, String movieDiscrip) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("moviecode", moviecode);
		map.put("movieImg", movieImg);
		map.put("movieDiscrip", movieDiscrip);
		dao.insertMovieImg(map);
		return "success";
	}
	
	//영화 포스터, 내용 가져오기
	@RequestMapping(value="/bootstrap/searchMovieByCd.do")
	public MoviePosterVO searchMovieImg(String movieCd) {
		//System.out.println(dao.searchMovieImg(movieCd));
		return dao.searchMovieByCd(movieCd);
	}
	
	//빈하트에서 찜하기 클릭 시 likemovie에 해당 정보 입력
	@RequestMapping(value="/bootstrap/likeMovieInsert.do")
	public String likeMovieInsert(String id, String movieCd) {
		LikeMovieVO vo=new LikeMovieVO();
		vo.setId(id);
		vo.setMovieCd(movieCd);
		dao.likeMovieInsert(vo);
		return "";
	}
	
	//빨간하트에서 찜하기 클릭시 likemovie에서 해당 정보 삭제
	@RequestMapping(value="/bootstrap/likeMovieDelete.do")
	public String likeMovieDelete(String id, String movieCd) {
		LikeMovieVO vo= new LikeMovieVO();
		vo.setId(id);
		vo.setMovieCd(movieCd);
		dao.likeMovieDelete(vo);
		return "";
	}
	
	//id, movidCd에 해당하는 영화가 찜 된 상태인지 확인
	@RequestMapping(value="/bootstrap/likeMovieSearch.do")
	public String likeMovieSearch(String id, String movieCd) {
		LikeMovieVO vo=new LikeMovieVO();
		vo.setId(id);
		vo.setMovieCd(movieCd);
		return dao.likeMovieSearch(vo);
	}
	
	//내정보에서 likemovie데이터 출력
	@RequestMapping(value="/bootstrap/likeMovieSelect.do")
	public List<LikeMovieVO> likeMovieSelect(String id) {
		return dao.likemovieSelect(id);
	
	}
}
