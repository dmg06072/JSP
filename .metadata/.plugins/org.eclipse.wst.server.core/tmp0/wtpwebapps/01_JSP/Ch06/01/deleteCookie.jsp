<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cookieName = request.getParameter("name");
	if(cookieName != null) {
		Cookie cookie = new Cookie(cookieName,null);	// 빈 value의 쿠기 생성
		cookie.setMaxAge(0);	// 쿠키유지시간 0초(바로 만료 처리)
		cookie.setPath("/");	// 쿠키적용 URI설정( / : 현재 도메인의 모든 영역)
		response.addCookie(cookie);
	}
	
	out.println("<script>alert('쿠키가 삭제되었습니다!'); location.href='getCookie.jsp'; </script>");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>