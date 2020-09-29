<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>addCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>카테고리 입력</h1>
	<form action="<%=request.getContextPath() %>/category/addCategoryAction.jsp" method="post">
		<div>카테고리 이름</div>
		<div><input class="form-control" type="text" name="categoryName"></div>
		<div><button class="btn btn-success" type="submit">카테고리 추가</button></div>
	</form>
</div>
</body>
</html>