<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") != null) {
		System.out.println("이미 로그인 되어있습니다.");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").click(function() { // 유효성 검사 코드
			if($("#adminId").val()<1) {
				alert("ID 입력");
				return;
			}else if($("#adminPw").val()<1) {
				alert("pw 입력");
				return;
			}
			$("#addForm").submit();
		});
	});
</script>
</head>
<body>
<div class="container jumbotron">
	<h1>관리자 로그인</h1>
	<form action="<%=request.getContextPath() %>/loginAction.jsp" method="post" id="addForm">
		<table class="table-bordered">
			<tr>
				<td>ID</td>
				<td><input type="text" name="adminId" id="adminId"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="adminPw" id="adminPw"></td>
			</tr>
		</table>
		<button class="btn btn-primary" type="button" id="btn">LOGIN</button>
	</form>
</div>
</body>
</html>