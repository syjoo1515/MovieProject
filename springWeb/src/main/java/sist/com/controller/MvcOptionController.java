package sist.com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import sist.com.dao.BoardDao;
import sist.com.vo.ScrapVO;
import sist.com.vo.StudentVO;

@Controller
@SessionAttributes(value= {"sList","strList"})
public class MvcOptionController {
   @Inject
   private BoardDao dao;
   
   //@ModelAttribute: 어떤 경로로 들어든 인자를 넘길 수 있음
   //(model이기 때문에 dispatcher로 갈때만 사용 가능. redirect로 할꺼면 session으로 해야함)
   @ModelAttribute(name="sList")
   private List<StudentVO>selectSt(){
      return dao.selectStudentAction();
   }
   
   @ModelAttribute(name="strList")
   private List selectString(){
	   ArrayList<String>list=new ArrayList<String>();
	   list.add("가나다");
	   list.add("라마바");
	      return list;
	   }
   

   //redirect로 보내면 model은 안나옴
   @GetMapping(value="Java.do")
   public String javaProc(Model model) {
      model.addAttribute("msg", "JavaAction");
      return "redirect:mvcOption/mvcOprionEx1Result.jsp";
   }
   
   //dispatcher라 나옴
   @GetMapping(value="Xml.do")
   public String xmlProc(Model model) {
      model.addAttribute("msg", "XmlAction");
      return "mvcOption/mvcOprionEx1Result";
   }
   @GetMapping(value="Oracle.do")
   public String oracleProc(Model model) {
      model.addAttribute("msg", "OracleAction");
      return "mvcOption/mvcOprionEx1Result";
   }
   
   
   //이런식으로 넘길 수도 있음. 
   @RequestMapping(value="modelArgDemo.do")
   public String modelProc(Model model, @ModelAttribute(name="sv")ScrapVO vo) {
      System.out.println(vo);
	   model.addAttribute("msg", "OracleAction");
      return "mvcOption/mvcOprionEx1Result.jsp";
   } 
   
   @RequestMapping(value="headerEx1.do")
   public String injectHead(@RequestHeader("Accept")String acceptType,@RequestHeader("Host")String host, Model model) {
	   model.addAttribute("acceptType",acceptType);
	   model.addAttribute("host",host);
	   return "mvcOption/mvcOptionEx2result";
   }
   
   @RequestMapping(value="headerEx2.do")
   public String injectHead2(@RequestHeader Map<String, String>map, ModelMap modelmap) {
	   modelmap.addAttribute("map",map);
	   return "mvcOption/mvcOptionEx2result";
   }
   
   @RequestMapping(value="nullPoint.do")
   public String execptionEx1(int no) {
	   String str=null;
	   if(no>10) {
		   str=new String("Default");
	   }
	   str.concat("Demo");
	   return "mvcOption/noneException";
   }
   
   @RequestMapping(value="cast.do")
   public String exceptionEx2() {
      String str=(String)new Object();
      return "mvcOption/noneException";
   }
   @ExceptionHandler(ClassCastException.class)
   public String execeptionExAction(ClassCastException e,Model model) {
      model.addAttribute("msg", "Cast!");
      model.addAttribute("exeception",e);
      return "mvcOption/errorException";
   }
   @ExceptionHandler(NullPointerException.class)
   public String execeptionExAction(NullPointerException e,Model model) {
      model.addAttribute("msg", "ErrorCheck!");
      model.addAttribute("exeception",e);
      return "mvcOption/errorException";
   }

}

