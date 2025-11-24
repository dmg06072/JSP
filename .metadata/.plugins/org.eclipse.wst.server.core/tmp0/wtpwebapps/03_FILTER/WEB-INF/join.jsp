<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JOIN PAGE</h1>
	<form action="${pageContext.request.contextPath}/join.do" method="post">
		<div>
			<label>계정명 : </label> <span>${username_msg} </span> <br/>
			<input name="username" />
		</div>
		<div>
			<label>패스워드 : </label> <span>${password_msg} </span> <br/>
			<input type="password" name="password" />
		</div>
		
		<button>회원가입</button>
	</form>
	
</body>
</html>