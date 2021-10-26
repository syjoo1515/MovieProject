package sist.com.di.basic6;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/aaa") //같은 패키지 안에 여러 @RequestMapping있을 때 모두 겹치면 안됨- 클래스 달라도 패키지 같으면 겹치면 안되므로 여기서 일단 한번 분류하는것
public class Basic6Controller  extends Object{//pojo
   //@Inject
   @Resource(name="messageColor")
   private MessageColor messageColor;
   

   
   @RequestMapping("mvcSpringDemo/locationActionImg.do")
   public String messageImagSuccess(String alt,Model model,HttpSession session) {
      /*model.addAttribute("id", alt);      
      model.addAttribute("message", messageColor.getColorMessage(alt));*/
      session.setAttribute("id", alt);
      session.setAttribute("message", messageColor.getColorMessage(alt));
      
      return "redirect:mvcAction2Result.jsp";
   }
   
 //String-redirec/dispatcher 모두 가능
   @RequestMapping(value="locationAction.do")
   public String messageSuccess(String id,Model model) {
      model.addAttribute("id", id);   
      model.addAttribute("message", messageColor.getColorMessage(id));
      return "mvcSpringDemo/mvcAction2Result";
   }
   
   
   @RequestMapping("mvcSpringDemo/STUDENTLIST.do")
   public ModelAndView studentListAction(String state) {
      ModelAndView mv=new ModelAndView();
      mv.addObject("state", state);
      mv.setViewName("mvcSpringDemo/stud");
      return mv;
   }
   
 //보낼 때 변수명이랑 parameter 변수랑 이름 같아야함 
   @RequestMapping("mvcSpringDemo/LOGIN.do")
   public String loginActionPro(@RequestParam(value="state",required=false,defaultValue="Action")String state, String id,Model model) {
      model.addAttribute("fail","loginFail");
      return id.equals("blue")?"redirect:/loginList.do":"mvcSpringDemo/loginFail";
   }
   @RequestMapping("loginList.do")
   public String loginListAction(Model model) {
      model.addAttribute("msg", "loginSuccess");
      return "mvcSpringDemo/loginSuccess";
   }
   
 //void-dispatcher로만 보낼 수 있다. 파일명 핸들링 불가능
   @RequestMapping("mvcSpringDemo/EMPLIST.do")
   public void empListAction(@RequestParam(value="state",required=false,defaultValue="Action")String state,ModelMap map) {
      System.out.println("State:"+state);
      map.addAttribute("state",state);
   }
   
   
}

