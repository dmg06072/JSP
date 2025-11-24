<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 선언문 -->
<%@ page import="Ch02.*,Ch04.*" %>
<%!
	public boolean isValid(UserDto dto){
		if(dto.getUserid().isEmpty()){
			System.out.println("Userid를 입력하세요.");
			return false;
		}
		if(dto.getUserid().length()<=5){
			System.out.println("Userid를 5자 이상 입력해주세요.");
			return false;
		}
		return true;
	}	
%>    

<%
	/* 문자셋 설정 */
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!-- 01 파라미터 받기 -->
<jsp:useBean id="dto" class="Ch02.UserDto" scope="request" />
<jsp:setProperty name="dto" property="*" />

<%
	
	//02 유효성 검증	
	if(!isValid(dto)){
		//유효하지 않는경우에 -> 01Join.html 
		response.sendRedirect("./01Join.html");
	}
	//03 서비스 처리(회원가입->DB 저장)
	
	//03-01 db연결
	DbUtils.conn();	
	
	//03-02 동일 계정유무확인
	//03-03 계정정보 저장
	//03-04 연결해제
	//DbUtils.disConn();

	//04 로그인 페이지로 이동
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	DTO : <%=dto %><br>
</body>
</html>