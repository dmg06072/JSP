<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*,Ch04.*" %>

<%
   //DB CONN DATA
   String id = "root";
   String pw = "1234";
   String url = "jdbc:mysql://localhost:3306/opendatadb";
   
   //JDBC참조변수
   Connection conn = null;         // DBMS 의 특정 DB와 연결되는 객체
   PreparedStatement pstmt = null;   // SQL Query 전송용 객체
   ResultSet rs = null;         // Select 결과물 담을 객체
   
   //연결작업
   List<Sample1Dto> list = null;
         try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Loading Success...");
            conn = DriverManager.getConnection(url,id,pw);
            System.out.println("DB CONNECTED...");
            //sql query 객체 생성
            pstmt = conn.prepareStatement("SELECT * FROM sample1");

            rs =  pstmt.executeQuery();
            list = new ArrayList();
            Sample1Dto dto = null;
            if(rs!=null) {
               while(rs.next()) {
                  dto=new Sample1Dto();
                  dto.setNo(rs.getString("no"));
                  dto.setCol1(rs.getString("Col1"));
                  dto.setCol2(rs.getString("Col2"));
                  dto.setCol3(rs.getString("Col3"));
                  list.add(dto);
            /*       System.out.print(rs.getString("no")+"_");
                  System.out.print(rs.getString("col1")+"_");
                  System.out.print(rs.getString("col2")+"_");
                  System.out.println(rs.getString("col3"));    */   
               }
            }
            
         }catch(ClassNotFoundException e1) {
            System.out.println("클래스 부재 예외발생!");
         }catch(SQLException e2) {
//            System.out.println("SQL 예외발생!");
            e2.printStackTrace();
         }finally {
            try {conn.close();} catch (SQLException e) {e.printStackTrace();}
         }

%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <table style="border : 1px solid;">
      <thead>
         <th>no</th>
         <th>col1</th>
         <th>col2</th>
         <th>col3</th>
      </thead>
      <tbody>
         <%
         for(Sample1Dto dto : list){
            %>
               <tr>
                  <td><%=dto.getNo() %></td>
                  <td><%=dto.getCol1() %></td>
                  <td><%=dto.getCol2() %></td>
                  <td><%=dto.getCol3() %></td>
               </tr>   
            <%
         }
               
         
         %>
      </tbody>
   </table>






</body>
</html>