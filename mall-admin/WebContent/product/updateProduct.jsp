<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" import="java.sql.*" %>
<%
	if(session.getAttribute("loginAdminId")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect("/mall-admin/login.jsp"); // login페이지로 돌아가시오
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
		// 제품 수정 페이지입니다.
		request.setCharacterEncoding("utf-8");
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
				
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
		System.out.println(productId);
	%>
	<h1>상품 수정</h1>
	<form action="<%=request.getContextPath()%>/product/updateProductAction.jsp" method="post">
		<input type="hidden" name="productId" value="<%=productId%>">
		<table class="table table-bordered table-dark">
			<tr>
				<td>category_id</td>
				<td>
					<select class="form-control" name="categoryId">
						<option value="">카테고리 선택</option>
						<%
							for(Category c : categoryList) {
						%>
								<option 
								<%
									if(product.getCategoryId()==c.getCategoryId()) {
								%> value="<%=c.getCategoryId()%>" selected="selected"
								<%
									} else {
								%>
								   value="<%=c.getCategoryId()%>"
								<% 	
									}
								%>
								><%=c.getCategoryName()%></option>
						<%
						}
						%>		
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input class="form-control" type="text" name="productName" value="<%=product.getProductName()%>"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input class="form-control" type="text" name="productPrice"  value="<%=product.getProductPrice()%>"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><textarea class="form-control" rows="5" cols="80" name="productContent"><%=product.getProductContent()%></textarea></td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td>
					<%
						if(product.getProductSoldout().equals("N")) {
							%>
							<input type="radio" name="productSoldout" value="N" checked="checked">품절아님
							<input type="radio" name="productSoldout" value="Y">품절
							<%
						}
						else {
						%>
						<input type="radio" name="productSoldout" value="N">품절아님
						<input type="radio" name="productSoldout" value="Y" checked="checked">품절
						<%
					}
					%>
				</td>
			</tr>
		</table>
		<button class="btn btn-success" type="submit">상품 수정</button>
	</form>
</div>
</body>
</html>