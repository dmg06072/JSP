package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/join.do")

public class C04Servlet_test extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 페이지 전송
		System.out.println("GET /join.do..");
		req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원가입 처리
		System.out.println("POST /join.do..");
		// 01 파라미터
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		// 02 유효성
		if(!isvalid(username,password,req)) {
			// 로그인 페이지 이동(message 전달)
			req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
			return;
		}
		// 03 서비스처리(회원가입처리)
		try {
		DbUtils.conn();
		int result = DbUtils.insertUser(username, password);
		if (result<=0) {
			req.getRequestDispatcher("/WEB-INF/join.jsp").forward(req, resp);
			return;
		}
		DbUtils.disConn();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		// 04 뷰로 이동(뷰로 데이터 전송)
		HttpSession session = req.getSession();
		session.setAttribute("message", "회원가입 성공!");
		resp.sendRedirect(req.getContextPath()+ "/login.do");
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
