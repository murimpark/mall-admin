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
<title>categoryList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<h1>카테고리 목록</h1>
	<div>
		<a class="btn btn-primary" href="<%=request.getContextPath() %>/category/addCategory.jsp">카테고리 추가</a>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
	%>
	<table class="table table-striped table-hover table-dark">
		<thead>
			<tr>
				<th>categoryId</th>
				<th>categoryName</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Category c : list) {
		%>
			<tr>
				<td><%=c.getCategoryId() %></td>
				<td><%=c.getCategoryName() %></td>
				<th><a class="btn btn-primary" href="<%=request.getContextPath() %>/category/updateCategory.jsp?categoryId=<%=c.getCategoryId() %>">수정</a></th>
				<th><a class="btn btn-primary" href="<%=request.getContextPath() %>/category/deleteCategoryAction.jsp?categoryId=<%=c.getCategoryId() %>">삭제</a></th>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</div>	
</body>
</html>