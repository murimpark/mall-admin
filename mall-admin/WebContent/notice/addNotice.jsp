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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").click(function() { // 유효성 검사 코드
			if($("#noticeTitle").val() == "") {
				alert("제목 입력");
				return;
			}else if($("#noticeContent").val() == "") {
				alert("내용 입력");
				return;
			}
			$("#addForm").submit();
		});
	});
</script>
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<h1>공지 추가</h1>
	<form action="<%=request.getContextPath()%>/notice/addNoticeAction.jsp" method="post" id="addForm">
		<table class="table table-bordered table-dark">
			<tr>
				<td>공지 제목</td>
				<td><input class="form-control" type="text" name="noticeTitle" id="noticeTitle"></td>
			</tr>
			<tr>
				<td>공지 내용</td>
				<td><textarea class="form-control" rows="5" cols="80" name="noticeContent" id="noticeContent"></textarea></td>
			</tr>
		</table>
		<button class="btn btn-success" type="button" id="btn">공지 추가</button>
	</form>
</div>
</body>
</html>