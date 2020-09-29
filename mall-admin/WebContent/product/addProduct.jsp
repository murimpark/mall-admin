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
		// 상품 추가 페이지입니다.
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1>상품추가</h1>
	<form action="<%=request.getContextPath()%>/product/addProductAction.jsp" method="post">
		<table class="table table-bordered table-dark">
			<tr>
				<td>category_id</td>
				<td>
					<select class="form-control" name="categoryId">
						<option value="">카테고리 선택</option>
						<%
							for(Category c : categoryList){
						%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
						<%
							}
						%>		
						
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input class="form-control" type="text" name="productName"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input class="form-control" type="text" name="productPrice"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><textarea class="form-control" rows="5" cols="80" name="productContent"></textarea></td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td><input type="radio" name="productSoldout" value="N" checked="checked">품절아님
				<input type="radio" name="productSoldout" value="Y">품절</td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">상품 추가</button>
	</form>
</div>
</body>
</html>