<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" import="java.sql.*" %>
<%
	if(session.getAttribute("loginAdminId")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addProduct</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		NoticeDao noticeDao = new NoticeDao();
		Notice notice = noticeDao.selectNoticeOne(noticeId);
	%>
	<h1>공지 수정</h1>
	<form action="<%=request.getContextPath()%>/notice/updateNoticeAction.jsp" method="post">
		<input type="hidden" name="noticeId" value="<%=notice.getNoticeId() %>">
		<table class="table table-bordered table-dark">
			<tr>
				<td>공지 제목</td>
				<td><input class="form-control" type="text" name="noticeTitle" value="<%=notice.getNoticeTitle()%>"></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td><textarea class="form-control" rows="5" cols="80" name="noticeContent"><%=notice.getNoticeContent()%></textarea></td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">공지 수정</button>
	</form>
</div>
</body>
</html>