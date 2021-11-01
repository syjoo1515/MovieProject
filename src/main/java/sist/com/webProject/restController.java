package sist.com.webProject;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.mainDao;
import sist.com.vo.userVO;

@RestController
public class restController {
	
	@Autowired
	private mainDao dao;
	
 
	//영화 포스터 췝 크롤링
	@RequestMapping(value="movieImg.do")
	public String activateBot(String moviecode) {
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
			String title = element.getAttribute("src");
 
			return title;
			
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		} finally {
			driver.close();
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
	
	
}
