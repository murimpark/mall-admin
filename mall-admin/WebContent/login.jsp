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
</head>
<body>
<div class="container jumbotron">
	<h1>관리자 로그인</h1>
	<form action="<%=request.getContextPath() %>/loginAction.jsp" method="post">
		<table class="table-bordered">
			<tr>
				<td>ID</td>
				<td><input type="text" name="adminId" value="admin"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="adminPw" value="1234"></td>
			</tr>
		</table>
		<button class="btn btn-primary" type="submit" >LOGIN</button>
	</form>
</div>
</body>
</html>