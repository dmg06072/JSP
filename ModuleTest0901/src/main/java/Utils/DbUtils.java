package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Dtos.MemberDto;


public class DbUtils {
	//속성(DB 연결관련된 멤버)
	//DB CONN DATA
	private static String id = "root";
	private static String pw = "1234";
	private static String url = "jdbc:mysql://localhost:3306/opendatadb";

	//JDBC참조변수
	private static Connection conn = null; // DBMS 의 특정 DB와 연결되는 객체
	private static PreparedStatement pstmt = null; // SQL Query 전송용 객체
	private static ResultSet rs = null; // Select 결과물 담을 객체
	
	//기능
	public static void conn() throws Exception
	{
		//드라이브 클래스 메모리 공간 적재
		// 발생 가능한 예외를 호출한 쪽으로 던진 후 아래의 코드를 실행(DB 로딩, 연결)
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println("Driver Loading Success");
		// JDBC 드라이버 로딩
        // 클래스 경로에서 com.mysql.cj.jdbc.Driver 클래스 파일을 찾아서 불어옴
		//Connection conn 멤버에 Connection 객체 연결
		conn = DriverManager.getConnection(url,id,pw);
		System.out.println("DB CONNECTED");
	}
	 // Class.forName으로 불러온 드라이버를 사용할 수 있게 등록 후 url과 일치하는 드라이버를 선택해서 DB와 연결
	public static void disConn() throws Exception {
		//rs / pstmt / conn close 처리
		if(rs != null) 
			rs.close();
		if(pstmt != null) 
			pstmt.close();
		if(conn != null) 
			conn.close();
	}	
	public static int insertMember(MemberDto memberDto) throws Exception 
	{
		// 회원 정보를 DB에 저장하는 메서드
		pstmt = conn.prepareStatement("insert into tbl_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		// 실행할 SQL문장을 미리 준비한다. ?는 채워질 자리
		pstmt.setString(1, memberDto.getUserid());
		pstmt.setString(2, memberDto.getPassword());
		pstmt.setString(3, memberDto.getRePassword());
		pstmt.setString(4, memberDto.getUsername());
		pstmt.setString(5, memberDto.getZipcode());
		pstmt.setString(6, memberDto.getAddr1());
		pstmt.setString(7, memberDto.getAddr2());
		pstmt.setString(8, memberDto.getPhone1());
		pstmt.setString(9, memberDto.getPhone2());
		pstmt.setString(10, memberDto.getPhone3());
		pstmt.setString(11, memberDto.getTel1());
		pstmt.setString(12, memberDto.getTel2());
		pstmt.setString(13, memberDto.getTel3());
		pstmt.setString(14, memberDto.getEmail());
		pstmt.setString(15, memberDto.getYear());
		pstmt.setString(16, memberDto.getMonth());
		pstmt.setString(17, memberDto.getDay());
		//tbl_member 에 dto 값 저장 후 int 반환
		int result = pstmt.executeUpdate();
		// SQL 실행 후 영향받은 행의 수 반환
		return result;
		// 결과 값 반환
	}
	
	public static MemberDto selectMember(String userid) throws Exception{	
		//tbl_member 에 userid 와 일치하는 데이터 받아와 MemberDto로 반환
		pstmt = conn.prepareStatement("select * from tbl_member where userid=?");
		pstmt.setString(1,  userid);
		rs = pstmt.executeQuery();
		MemberDto dto = null;
		if(rs != null && rs.next()) {
			dto = new MemberDto();
			dto.setUsername(rs.getString("username"));
			dto.setPassword(rs.getString("password"));
			dto.setUsername(rs.getString("username"));
            dto.setUsername(rs.getString("zipcode"));
            dto.setAddr1(rs.getString("addr1"));
            dto.setAddr2(rs.getString("addr2"));
            dto.setPhone1(rs.getString("phone1"));
            dto.setPhone2(rs.getString("phone2"));
            dto.setPhone3(rs.getString("phone3"));
            dto.setTel1(rs.getString("tel1"));
            dto.setTel2(rs.getString("tel2"));
            dto.setTel3(rs.getString("tel3"));
            dto.setEmail(rs.getString("email"));
            dto.setYear(rs.getString("year"));
            dto.setMonth(rs.getString("month"));
            dto.setDay(rs.getString("day"));
		}
		// tbl_member 에 userid 와 일치하는 데이터 받아와 MemberDto로 반환  
		return dto;
		
	}
	
	public static void TxStart() throws Exception{
		if(conn!=null)
			conn.setAutoCommit(false);
	}
	// 자동 커밋 끄고 트랜잭션을 수동으로 관리
	
	public static void TxEnd() throws Exception {
		if(conn!=null)
			conn.commit();
	}
	// 트랜잭션 종료
	// DB 연결이 존재할 경우 지금까지 실행한 작업을 DB에 확정(commit)
	
	public static void RollBack() throws Exception {
		if(conn!=null)
			conn.rollback();	
	}
	//문제가 생기면 지금까지의 변경사항을 모두 취소해서 DB를 원래 상태로 되돌림
	
}