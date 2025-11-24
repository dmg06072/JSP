<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		request 내장객체 : 요청정보값 저장(Http Request Protocol의 구조형태)
	*/	

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String bgColor = request.getParameter("bgcolor");
	System.out.printf("%s %s %s \n", username, password, bgColor);

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:<%=bgColor%>">
		<h1>강사컴퓨터 Process File</h1>
		
		username : <%=username %><br/>
		password : <%=password %><br/>
		bgcolor : <%=bgColor %><br/>
</body>
</html>