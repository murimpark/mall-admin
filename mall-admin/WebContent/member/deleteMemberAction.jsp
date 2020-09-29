<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
<%
	if(session.getAttribute("loginAdminId")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	String MemberEmail = request.getParameter("memberEmail");
	Member member = new Member();
	member.setMemberEmail(MemberEmail);
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(member);
	response.sendRedirect(request.getContextPath()+"/member/memberList.jsp");
%>