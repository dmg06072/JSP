<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	Cookie [] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie cookie : cookies) {
			System.out.println(cookie.getName()+" : " + cookie.getValue());
			%>
				<a href="./deleteCookie.jsp?name=<%=cookie.getName()%>">쿠키삭제(<%=cookie.getName() %>)</a> <br/>
			<%
		}
	}

%>

</body>
</html>