<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="dao.*" import="vo.*"%>
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
<title>noticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<h1>공지</h1>
	<div>
		<a class="btn btn-primary" href="<%=request.getContextPath() %>/notice/addNotice.jsp">공지 추가</a>
	</div>
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> list = noticeDao.selectNoticeList();
	%>
	<table class="table table-striped table-hover table-dark">
		<thead>
			<tr>
				<th>noticeId</th>
				<th>제목</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Notice n : list) {
				int noticeId = n.getNoticeId();
		%>
			<tr>
				<td><%=n.getNoticeId() %></td>
				<td><a href="<%=request.getContextPath() %>/notice/noticeListOne.jsp?noticeId=<%=n.getNoticeId() %>"><%=n.getNoticeTitle() %></a></td>
				<td><%=n.getNoticeDate() %>
				<th><a href="<%=request.getContextPath() %>/notice/deleteNoticeAction.jsp?noticeId=<%=n.getNoticeId() %>">삭제</a></th>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</div>	
</body>
</html>