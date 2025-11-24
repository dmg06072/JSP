package Servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbUtils {
	// 속성(DB 연결관련된 멤버)
	// DB CONN DATA
	private static String id = "root";
	private static String pw = "1234";
	private static String url = "jdbc:mysql://localhost:3306/opendatadb";

	// JDBC참조변수
	private static Connection conn = null; // DBMS 의 특정 DB와 연결되는 객체
	private static PreparedStatement pstmt = null; // SQL Query 전송용 객체
	private static ResultSet rs = null; // Select 결과물 담을 객체

	// 기능
	public static void conn() throws Exception {
		// 드라이브 클래스 메모리 공간 적재
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		System.out.println("Driver Loading Success...");
//		// Connection conn 멤버에 Connection 객체 연결
//		conn = DriverManager.getConnection(url, id, pw);
//		System.out.println("DB CONNECTED...");
		
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		
		DataSource dataSource = (DataSource)envContext.lookup("jdbc/MysqlDB");
		conn = dataSource.getConnection();
		System.out.println("Conn : " + conn);
				
	}

	public static void disConn() throws Exception {
		// rs / pstmt / conn close 처리
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

	public static int insertUser(String username, String password) throws Exception {
		pstmt = conn.prepareStatement("insert into tbl_user values(?,?,?,?,?,?)");
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		pstmt.setString(3, "");
		pstmt.setString(4, "");
		pstmt.setString(5, "");
		pstmt.setString(6, "");
		int result = pstmt.executeUpdate();

		return result;

	}
	
	public static UserDto selectUser(String username) throws Exception{
		pstmt = conn.prepareStatement("select * from tbl_user where userid=?");
		pstmt.setString(1,  username);
		rs = pstmt.executeQuery();
		UserDto dto = null;
		if(rs != null && rs.next()) {
			dto = new UserDto();
			dto.setUsername(rs.getString("username"));
			dto.setPassword(rs.getString("password"));
		}
		return dto;
	
	}
}
