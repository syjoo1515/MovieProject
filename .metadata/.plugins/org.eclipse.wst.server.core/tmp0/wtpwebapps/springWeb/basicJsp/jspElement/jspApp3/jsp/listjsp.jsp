<!--HashMap���� �����  -->
<!--�ٵ� �׳� LinkedHashMap���� �ٲٸ� �ɰŰ�����....  -->

<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<link href="/firstweb/basicJsp/jspElement/jspApp3/css/contents.css" rel="stylesheet" type="text/css" />
</head>
<body >
<%-- ${student!=null?student:professor}
<%
    String student=(String)request.getAttribute("student");
    String professor=(String)request.getAttribute("professor");
%>
<%= student!=null?student:professor%> --%>
<%
    List<HashMap<String,Object>>list=(List<HashMap<String,Object>>)request.getAttribute("item");
    int headSize=list.get(0).keySet().size();
%>

   <div id="wrapper">
      <div id="header">
            <div class="topInfoWrap">
               <div class="topInfoArea clfix">
                  <div class="loginWrap">
                     <span class="fir"></span>
                     <span></span>
                     <span><em>OOO��</em> ���� �Ϸ� �Ǽ���</span>
                     <a href="" class="btnLogout"><img src="/firstweb/basicJsp/jspElement/jspApp3/img/common/btn_logout.gif" alt="�α׾ƿ�" /></a>
                  </div>
               </div>
            </div>
            <div class="gnbSubWrap">
               
            </div>
         </div>
      <div id="container">
         <div id="contentsWrap" class="contentsWrap">
            <div class="contents">
               <h1 class="title">�Խ��� ����Ʈ</h1>
               <div class="btnSet clfix mgb15">
                  <span class="fr">
                     <span class="button"><a href="#">�˻�</a></span>
                     <span class="button"><a href="#">�۾���</a></span>
                  </span>
               </div>

               <table class="bbsWrite mgb35">
                  <caption></caption>
                  <colgroup>
                     <%
                       for(int i=0;i<headSize;i++){ 
                     %>
                     <col width="100" />
                     <%
                       }
                     %>
                  </colgroup>
                  <tbody>
                  <tr>
                     <th>�˻�</th>
                     <td>
                        <select>
                           <option>�����ϼ���</option>
                        </select>
                        <input type="text" name="" class="inputText" size="30" />
                     </td>
                  </tr>
                  </tbody>
               </table>

               <table class="bbsList">
                  <colgroup>
                      <%
                       for(int i=0;i<headSize;i++){ 
                     %>
                     <col width="100" />
                     <%
                       }
                     %>
                     
                  </colgroup>
                  <thead>
                     <%
                       Iterator<String>iter=list.get(0).keySet().iterator();
                       String []key=new String[list.get(0).keySet().size()];
                     %>
                    <tr>
                       <%
                         int i=0;
                         while(iter.hasNext()){                            
                            %>
                              <th><%=(key[i++]=iter.next()) %></th>
                            <%
                         }
                       %>
                    </tr>
                  </thead>
                  <tbody>      
                    <%
                      for(int a=0;a<list.size();a++){
                         HashMap<String,Object>m=list.get(a);
                    %>            
                     <tr>
                       <%
                          for(String str:key){
                       %>
                         <td><%=m.get(str) %></td>
                       <%
                          }
                       %>
                     </tr>
                     <%
                      }
                     %>
                  </tbody>
               </table>

               <div class="paging">
                  <a href="#"><img src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_first.gif" alt="ó��������" /></a>
                  <a href="#"><img src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_prev.gif" alt="����" /></a>
                  
                  <span>
                     <a href="#">1</a>
                     <a href="#">2</a>
                     <a href="#">3</a>
                     <strong>4</strong>
                     <a href="#">5</a>
                     <a href="#">6</a>
                     <a href="#">7</a>
                     <a href="#">8</a>
                     <a href="#">9</a>
                  </span>            

                  <a href="#"><img src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_next.gif" alt="����" /></a>
                  <a href="#"><img src="/firstweb/basicJsp/jspElement/jspApp3/img/button/btn_last.gif" alt="������������" /></a>

               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>