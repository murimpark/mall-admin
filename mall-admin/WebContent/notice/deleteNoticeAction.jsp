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
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	Notice notice = new Notice();
	notice.setNoticeId(noticeId);
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(notice);
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>