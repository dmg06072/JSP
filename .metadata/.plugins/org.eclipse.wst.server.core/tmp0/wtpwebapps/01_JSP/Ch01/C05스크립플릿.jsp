<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
Scanner sc = new Scanner(System.in);
System.out.println("출력할 단 입력 : ");
int dan = sc.nextInt();
System.out.println(dan + "단");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{border:1px solid; margin:50px; padding: 30px;}
td{border:1px solid; margin 10px; font-size: 40px;}

</style>
</head>
<body>

	<!--
		단수 입력 받아 해당 구구단을 찍어보세요 (Table로 만드세요 - 스크립플릿)
	-->
	<table>
		<tbody>
			<%
			for (int a = 1; a <= 9; a++) {
			%>

			<tr>
				<td><%=dan + " " + "x" + " " + a + " " + " " + "=" + " " + dan*a + " " %></td>
				
			</tr>

			<%
			}
			%>
		</tbody>
	</table>


</body>
</html>