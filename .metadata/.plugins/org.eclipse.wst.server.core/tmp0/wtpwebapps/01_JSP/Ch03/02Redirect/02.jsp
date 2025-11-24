<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	request.setAttribute("C02","C02_value");
	// redirect
	// 파라미터 전달방법 : queryString으로 전송
	// 스코프를 이용(Session / Application)
	response.sendRedirect("./03.jsp?username="+username+"&password="+password);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>02.JSP PAGE</h1>
	USERNAME : <%=username %><br/>
	PASSWORD : <%=password %><br/>
	
</body>
</html>