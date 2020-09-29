<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" import="vo.*"%>
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
<title>updateCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		int categoryId= Integer.parseInt(request.getParameter("categoryId"));
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.selectCategoryOne(categoryId);
	%>
	
	<h1>카테고리 수정</h1>
	<form action="<%=request.getContextPath() %>/category/updateCategoryAction.jsp" method="post">
		<input type="hidden" name="categoryId" value="<%=category.getCategoryId()%>">
		<div>카테고리 이름</div>
		<div><input class="form-control" type="text" name="categoryName" value="<%=category.getCategoryName()%>"></div>
		<div><button class="btn btn-success" type="submit">카테고리 수정</button></div>
	</form>
</div>
</body>
</html>