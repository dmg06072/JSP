<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// Request 객체
	request.setAttribute("test1", "test1_Value");
	
	// Session 객체(지정된 시간까지 유지, 기본 1800초(30분))
	session.setAttribute("test2", "test_Value");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="./getSession.jsp"> 속성확인 페이지로 이동</a>

</body>
</html>