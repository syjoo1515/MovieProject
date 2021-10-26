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
//@RequestMapping("/aaa") //���� ��Ű�� �ȿ� ���� @RequestMapping���� �� ��� ��ġ�� �ȵ�- Ŭ���� �޶� ��Ű�� ������ ��ġ�� �ȵǹǷ� ���⼭ �ϴ� �ѹ� �з��ϴ°�
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
   
 //String-redirec/dispatcher ��� ����
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
   
 //���� �� �������̶� parameter ������ �̸� ���ƾ��� 
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
   
 //void-dispatcher�θ� ���� �� �ִ�. ���ϸ� �ڵ鸵 �Ұ���
   @RequestMapping("mvcSpringDemo/EMPLIST.do")
   public void empListAction(@RequestParam(value="state",required=false,defaultValue="Action")String state,ModelMap map) {
      System.out.println("State:"+state);
      map.addAttribute("state",state);
   }
   
   
}

