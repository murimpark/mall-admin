<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" import="vo.*" import="java.util.*"%>
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
<title>productList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%
		// 제품 리스트 페이지입니다.
		request.setCharacterEncoding("utf-8");
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){ // 카테고리 id가 채워져있을때 
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
	
		ProductDao productDao = new ProductDao(); // productDao 생성
		ArrayList<Product> productList = null;
		if(categoryId == -1) { // 카테고리번호가 -1개 이면
			productList = productDao.selectProductList();
		} else {
			productList = productDao.selectProductListByCategoryId(categoryId);
		}
		
		CategoryDao categoryDao = new CategoryDao(); 
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	
	<h1>상품 목록</h1>
	<div><a class="btn btn-primary" href="<%=request.getContextPath() %>/product/addProduct.jsp">상품 추가</a></div>
	<div class="btn-group">
	<a class="btn btn-secondary" href="<%=request.getContextPath() %>/product/productList.jsp">[전체]</a>
	<%
		for(Category c : categoryList) {
	%>
			<a class="btn btn-secondary" href="<%=request.getContextPath() %>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>">[<%=c.getCategoryName()%>]</a>	
	<%
		}
	%>
	</div>
	<table class="table table-dark table-hover table-striped">
		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>product_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
			</tr>
		</thead>
		<tbody>
			<% 
				for(Product p : productList) { 
					if(p.getProductSoldout().equals("Y")){
			%>
					<tr>
						<td><del><a class="text-white" href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></del></td>
						<td><del><%=p.getCategoryId() %></del></td>
						<td><del><%=p.getProductName() %></del></td>
						<td><del><%=p.getProductPrice() %></del></td>
						<td>품절</td>
					</tr>
			<% 
					}
					else {
			%>
					<tr>
						<td><a class="text-white" href="<%=request.getContextPath() %>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId()%></a></td>
						<td><%=p.getCategoryId() %></td>
						<td><%=p.getProductName() %></td>
						<td><%=p.getProductPrice() %></td>
						<td>판매중</td>
					</tr>
			<%
					}
				}
			%>
		</tbody>
	</table>
</div>	
</body>
</html>