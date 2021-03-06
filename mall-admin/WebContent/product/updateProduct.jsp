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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn").click(function() { // 유효성 검사 코드
			if($("#categoryId").val() == "") {
				alert("카테고리 선택");
				return;
			}else if($("#productName").val() == "") {
				alert("물품 이름 입력");
				return;
			}else if($("#productPrice").val() == "") {
				alert("가격 입력");
				return;
			}else if($("#productContent").val() == "") {
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
	<form action="<%=request.getContextPath()%>/product/updateProductAction.jsp" method="post" id="addForm">
		<input type="hidden" name="productId" value="<%=productId%>">
		<table class="table table-bordered table-dark">
			<tr>
				<td>category_id</td>
				<td>
					<select class="form-control" name="categoryId" id="categoryId">
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
				<td><input class="form-control" type="text" name="productName" value="<%=product.getProductName()%>" id="productName"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input class="form-control" type="text" name="productPrice"  value="<%=product.getProductPrice()%>" id="productPrice"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><textarea class="form-control" rows="5" cols="80" name="productContent" id="productContent"><%=product.getProductContent()%></textarea></td>
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
		<button class="btn btn-success" type="button" id="btn">상품 수정</button>
	</form>
</div>
</body>
</html>