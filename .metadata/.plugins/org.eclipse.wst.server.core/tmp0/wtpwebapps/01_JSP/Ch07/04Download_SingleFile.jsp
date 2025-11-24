<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String dirPath = pageContext.getServletContext().getRealPath("/")+"Ch07\\files\\";
	System.out.println("dirPath : " + dirPath);
	
	try{
		// INPUTSTREAM
		InputStream fin = new FileInputStream(dirPath+"b.jpg");
		// OUTPUTSTREAM
		out.clear();					// response outStream을 닫고 버퍼 초기화
		out=pageContext.pushBody();		// 현재페이지의 Body에 out 연결
		ServletOutputStream bout = response.getOutputStream();
		
		// Response Header Setting
		response.setHeader("Content-Type","application/octet-stream;charset-utf-8");
		response.setHeader("content-Disposition","attachment; filename=b.jpg");
		
		byte [] buff = new byte[4096];
		while(true){
			int data = fin.read();
			if(data == -1)
				break;
			bout.write(buff,0,data);
			bout.flush();
		}
		out.close();
		fin.close();
		
	}catch(Exception e){
		
	}
%>