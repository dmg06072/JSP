<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> 

<%
   Scanner sc = new Scanner(System.in);
   System.out.print("몇 단? ");
   int dan = sc.nextInt();
   
   sc.close();
%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <table>
      <summary><%=dan %></summary>
      <tbody>
      <%
      for(int i=1;i<10;i++)
      {
      %>
        <tr>
        	<td><%=dan %></td>
        	<td>x</td>
        	<td><%=i %></td>
        	<td>=</td>
        	<td><%=dan*i %></td>
        </tr>
      <%
      }
      %>
      
      </tbody>
   </table>


</body>
</html>













