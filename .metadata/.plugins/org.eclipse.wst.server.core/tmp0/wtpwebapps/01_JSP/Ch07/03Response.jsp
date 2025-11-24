<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.io.*" %>
<%
	//response.sendRedirect("./02Request.jsp");

	//response.sendError(HttpServletResponse.SC_REQUEST_TIMEOUT);
	
	//404 Error
	//response.sendError(HttpServletResponse.SC_NOT_FOUND,"해당 페이지를 찾을수가 없습니다");
	//403 Error
	//response.sendError(HttpServletResponse.SC_FORBIDDEN,"접근금지됨!");
	//5xx 에러 
	//response.sendError(HttpServletResponse.SC_BAD_GATEWAY,"서버 장애 발생!");
	
	
	/* 새로고침 */
	/* response.setIntHeader("Refresh",3); */
	
	/* OutStream 추출 */
	/* ServletOutputStream bout = response.getOutputStream();
	bout.write('a');
	bout.write(98); //b
	bout.flush();
	bout.close(); */
	
	/* out.write("<h1>HELLO WORLD</h1>"); */	// 참고

	PrintWriter o =  response.getWriter();
	o.write("<h1>HELLO WORLD</h1>");
	
%>
	<%@page import="java.util.*" %>
	<%=new Date() %>


</body>
</html>