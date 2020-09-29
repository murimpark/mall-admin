<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*" import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	Admin paraAdmin = new Admin();
	paraAdmin.setAdminId(adminId);
	paraAdmin.setAdminPw(adminPw);
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paraAdmin);
	if(loginAdmin == null) {
		System.out.println("로그인실패");
	} else {
		System.out.println("로그인성공");
		session.setAttribute("loginAdminId", loginAdmin.getAdminId());
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}  //session에 저장 (page < request < session)
%>