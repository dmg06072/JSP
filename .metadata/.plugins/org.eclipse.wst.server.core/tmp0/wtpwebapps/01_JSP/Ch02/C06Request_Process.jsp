<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="Ch02.TestDto" scope="request" />
<jsp:setProperty name="dto" property="stringtoDate" param="date" />
<jsp:setProperty name="dto" property="*" />

<%
	/* 문자셋 설정	*/
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<%
	System.out.println("dto : " + dto);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<h1>내 컴터 Process File</h1>
TestDto :
<%=dto%><br />


</body>
</html>