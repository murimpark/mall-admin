<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	session.invalidate(); // 지움
	response.sendRedirect(request.getContextPath()+"/login.jsp");
%>

