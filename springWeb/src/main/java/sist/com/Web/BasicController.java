package sist.com.Web;

import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BasicController {
	
	@Resource(name="loginAction")
	LoginAction action;
	
	@RequestMapping(value="loginAction.do")
	//form의 name 값과 같은 파라미터에 알아서 들어감 (name의 이름과 동일하게 쓰지 않으면 에러남)
	public ModelAndView loginProcess(String id, String password) {
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("id",id);
		//로그인 성공시 dispatcher로 보냄
		if(action.loginCheckAction(id, password)) {
			modelAndView.setViewName("/boardMVC/loginSuccess");
		}
		//로그인 실패시 redirect로 보냄
		else {
			modelAndView.setViewName("redirect:/boardMVC/signin.jsp");
		}
			
		return modelAndView;
	}
   
    
   //지정한 주소와 일치하면 해당 메소드 실행 후 해당 값을 dispatcher servlet에 리턴해줌
   @RequestMapping(value="buttonList.do")
   public ModelAndView basicListPark() {
      ModelAndView modelAndView=new ModelAndView();
      modelAndView.addObject("Message", "HelloSpringMVC1");
      modelAndView.setViewName("WEB-INF/views/parkList");
      return modelAndView;
   }
   @RequestMapping(value="buttonSet.do")
   public ModelAndView basicSetPark() {
      ModelAndView modelAndView=new ModelAndView();
      modelAndView.addObject("Message", "HelloSpringMVC2");
      modelAndView.setViewName("WEB-INF/views/parkSet");
      return modelAndView;
   }
   @RequestMapping(value="buttonMap.do")
   public ModelAndView basicMapPark() {
      ModelAndView modelAndView=new ModelAndView();
      modelAndView.addObject("Message", "HelloSpringMVC3");
      modelAndView.setViewName("mvcSpringDemo/actionView");
      return modelAndView;
   }

}