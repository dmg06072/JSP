<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>LOGIN FORM</h1>
	<form action="./login.jsp" method="post">
		<div>
			<label>아이디 : </label> <span>${username_msg}</span> <br/>
			<input type="text" name="username" />
		</div>
		<div>
			<label>패스워드 : </label> <span>${password_msg}</span><br/>
			<input type="password" name="password" />
		</div>
		<div>
			<button>로그인</button>
		</div>
		
	</form>
</body>
</html>