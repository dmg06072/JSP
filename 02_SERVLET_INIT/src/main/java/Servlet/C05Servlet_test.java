package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")

public class C05Servlet_test extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 페이지 전송
		System.out.println("GET /login.do..");
		
		HttpSession session = req.getSession();
		if(session.getAttribute("message")!=null) {
			String message = (String)session.getAttribute("message");
			session.removeAttribute("message");
			
			req.setAttribute("message", message);
		}
		
		
		req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 처리
		System.out.println("POST /login.do..");
		// 01 파라미터
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// 02 유효성
		if(!isvalid(username,password,req)) {
			// 로그인 페이지 이동(message 전달)
			req.getRequestDispatcher("/WEB-INF/login.jsp").forward(req, resp);
			return;
		}
		// 03 서비스처리(로그인 처리)
		// 사용자 ID
		// 입력한 PW 대조
		
		try {
			DbUtils.conn();
			UserDto dto = DbUtils.selectUser(username);
			// 사용자 ID 확인
			if (dto == null) {
				req.setAttribute("message", "동일한 계정이 존재하지 않습니다.");
				req.getRequestDispatcher("/WEB-INF/loin.jsp").forward(req, resp);
				return;
			}
			// 입력한 PW 대조
			if(!password.equals(dto.getPassword())) {
				req.setAttribute("message", "패스워드가 일치하지 않습니다.");
				req.getRequestDispatcher("/WEB-INF/loin.jsp").forward(req, resp);
				return;
			}
			DbUtils.disConn();
			// 인증완료 정보 + ROLE 저장 - SESSION
			HttpSession session = req.getSession();
			session.setAttribute("username", username);
			session.setAttribute("isAuth", true);
			session.setAttribute("role", "ROLE_USER");
			
			// 뷰로 이동
			session.setAttribute("message", "로그인 성공!");
			resp.sendRedirect(req.getContextPath() + "/main.do");
			
			
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				
			}

		// 04 뷰로 이동(뷰로 데이터 전송)

	}

	public boolean isvalid(String username, String password, HttpServletRequest req) {
		boolean flag=true;
		if(username.isEmpty()) {
			req.setAttribute("username_msg", "유저명을 입력하세요");
			flag=false;
		}
		if(password.isEmpty()) {
			req.setAttribute("password_msg", "패스워드를 입력하세요");
			flag=false;
		}
		return flag;
	}
}
