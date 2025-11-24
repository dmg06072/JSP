<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 문제 : 선언문(적절한 클래스 import 하기) -->
<%@ page import="Dtos.*,Utils.*" %>

<%
	/* 문제 : 문자셋 설정 */
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<%!
	/* 문제 : 유효성 검증함수 만들기 */
	public boolean isValid(MemberDto dto){
		//1) 각 항목 not null (message : '-' 를 입력하세요 - System.out 으로 출력후 false)
		// 각 항목이 비어있을 경우 항목에 해당하는 '항목명'을 입력하세요 라는 문구 출력 -> false 값 반환
		// 모든 항목이 비어있지 않고 모든 조건 만족 시 true 값 반환하여 다음으로 넘어감
		if(dto.getUserid().isEmpty()){
			System.out.println("Userid를 입력하세요.");
			return false;
		}
		if(dto.getPassword().isEmpty()){
			System.out.println("password를 입력하세요.");
			return false;
		}
		if(dto.getUsername().isEmpty()){
			System.out.println("Username을 입력하세요.");
			return false;
		}
		if(dto.getZipcode().isEmpty()){
			System.out.println("Zipcode를 입력하세요.");
			return false;
		}
		if(dto.getAddr1().isEmpty()){
			System.out.println("Addr1을 입력하세요.");
			return false;
		}
		if(dto.getAddr2().isEmpty()){
			System.out.println("Addr2를 입력하세요.");
			return false;
		}
		if(dto.getPhone1().isEmpty()){
			System.out.println("Phone1을 입력하세요.");
			return false;
		}
		if(dto.getPhone2().isEmpty()){
			System.out.println("Phone2를 입력하세요.");
			return false;
		}
		if(dto.getPhone3().isEmpty()){
			System.out.println("Phone3를 입력하세요.");
			return false;
		}
		if(dto.getTel1().isEmpty()){
			System.out.println("Tel1을 입력하세요.");
			return false;
		}
		if(dto.getTel2().isEmpty()){
			System.out.println("Tel2를 입력하세요.");
			return false;
		}
		if(dto.getTel3().isEmpty()){
			System.out.println("Tel3를 입력하세요.");
			return false;
		}
		if(dto.getEmail().isEmpty()){
			System.out.println("Email을 입력하세요.");
			return false;
		}
		if(dto.getYear().isEmpty()){
			System.out.println("year를 입력하세요.");
			return false;
		}
		if(dto.getMonth().isEmpty()){
			System.out.println("Month를 입력하세요.");
			return false;
		}
		if(dto.getDay().isEmpty()){
			System.out.println("Day를 입력하세요.");
			return false;
		}
		
		//2) userid 길이 5자 이하(message : Userid는 5자 이상 입력하셔야 합니다.- System.out 으로 출력후 false)
		if(dto.getUserid().length()<=5){
			System.out.println("Userid를 5자 이상 입력하서야 합니다.");
			return false;
		}
		//3) 패스워드 유효성 검증(regex : ^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,20}$ )
		//- System.out 으로 출력후 false
		if(dto.getPassword().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).{8,20}$ ")) {
			System.out.println("소문자, 대문자, 숫자, 특수문자 포함, 8자 이상 20자 이내로 입력해주세요");
			return false;
		}
		
		return true;
	}	
%>    



<!--  01 문제 : 파라미터 받기 (액션태그 jsp:useBean , jsp:setProperty 로 MemberDto 단위로 받기-->

<jsp:useBean id="dto" class="Dtos.MemberDto" scope="request" />
<jsp:setProperty name="dto" property="*"  />



<%
	
	try{
		//-----------------------------
		//02 유효성 검증	
		//-----------------------------
		if(!isValid(dto)){
			//유효하지 않는경우에 -> 01Join.html 로 Forwarding
			request.getRequestDispatcher("./01Join.html").forward(request, response);
			return;
		}
		//-----------------------------
		//03 서비스 처리(회원가입->DB 저장)
		//-----------------------------
		//03-01 db연결
		DbUtils.conn();
		
		//03-02 Tx 시작
		DbUtils.TxStart();
		
		//03-03 동일 계정유무확인
		MemberDto exist = DbUtils.selectMember(dto.getUserid());
		// DbUtils 클래스의 selectMember 메서드를 호출해 전달받은 userid로 회원 정보를 조회하고 exist 변수에 저장
		if(exist != null) {
			System.out.println("이미 존재하는 계정입니다.");
			request.getRequestDispatcher("./01Join.html").forward(request, response);
			return;
		}
		// 조회된 회원정보(exist)가 null 값이 아니라면, 즉 동일한 아이디가 이미 존재한다면
		// "이미 존재하는 계정입니다."라는 메시지 출력 후 01Join.html 페이지로 포워딩
		// 이후 코드 실행을 막기 위해 리턴
		
		
		//03-04 계정정보 저장
		int result = DbUtils.insertMember(dto);
		// DbUtils 클래스의 insertMember 메서드를 호출해 DB에 저장하고 결과 값 반환
		if(result <=0) {
			System.out.println("회원가입에 실패했습니다.");
			request.getRequestDispatcher("./01Join.html").forward(request, response);
			return;
		}
		// insertMember 실행 결과가 0 이하라면(저장 실패)
		// "회원가입에 실패했습니다." 라는 메시지 출력 후 01Join.html 페이지로 포워딩
		// 이후 코드 실행을 막기 위해 리턴
		
		//03-05 Tx 종료
		DbUtils.TxEnd();
		//03-06 연결해제
		DbUtils.disConn();
			
		
		//-----------------------------
		//04 로그인 페이지로 이동
		//-----------------------------
		//04-01 "회원가입을 완료했습니다" 를 system.out 으로 출력
		System.out.println("회원가입을 완료했습니다.");
		response.sendRedirect("./03Login.jsp");
	}
		//04-02 Login.jsp 로 리다이렉트
		catch(Exception e){
		//"문제 발생 ROLLBACK" system.out 출력
		System.out.println("문제 발생 ROLLBACK");
		//TX ROLLBACK 처리
		DbUtils.RollBack();
	}
		
%>