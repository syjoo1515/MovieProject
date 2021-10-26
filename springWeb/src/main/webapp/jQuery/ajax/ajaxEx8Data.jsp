<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
[
<c:forEach var="a" items="${AjaxList}" varStatus="cnt">
{"no":"${a.no}",
"name":"${a.name}",
"email":"${a.email}",
"pwd":"${a.pwd}",
"regdate":"${a.regdate}"
}
<c:if test="${f:length(AjaxList) ne cnt.count }">
,
</c:if>
</c:forEach>
]