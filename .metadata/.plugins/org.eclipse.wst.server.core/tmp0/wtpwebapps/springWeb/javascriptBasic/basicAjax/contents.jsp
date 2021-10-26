<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String state=request.getParameter("state");
	System.out.println(state);
%>

<%
	if(state.equals("dom")){
%>


Hello World
<%
	}else{
%>

hellooooo woooorld

<%
}
%>