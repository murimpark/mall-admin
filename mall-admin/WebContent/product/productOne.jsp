<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
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
<title>상세 물품</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	// 제품 상세 페이지입니다.
	int productId = Integer.parseInt(request.getParameter("productId")); //productId 받아옴
	System.out.println(productId); 
	
	Product product = new ProductDao().selectProductOne(productId); 
%>
	<h1>상품 상세보기</h1>
	<table class="table table-striped table-hover table-bordered">
		<tr>
			<td>product_pic</td>
			<td><img src="<%=request.getContextPath() %>/image/<%=product.getProductPic() %>">
			<a class="btn btn-primary" href="<%=request.getContextPath() %>/product/modifyProductPic.jsp?productId=<%=productId%>">이미지 수정</a></td>
			
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.getProductId() %></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.getCategoryId() %></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.getProductName() %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.getProductPrice() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.getProductContent() %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td>
				<%
					if(product.getProductSoldout().equals("Y")) {
				%>
						<a class="btn btn-primary" href="<%=request.getContextPath() %>/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[품절]</a>
				<%
					}
					else {
				%>
						<a class="btn btn-primary" href="<%=request.getContextPath() %>/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>">[판매중]</a>
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a class="btn btn-primary" href="<%=request.getContextPath() %>/product/updateProduct.jsp?productId=<%=productId%>">[수정]</a></td>
			<td><a class="btn btn-primary" href="<%=request.getContextPath() %>/product/deleteProductAction.jsp?productId=<%=productId%>">[삭제]</a></td>
		</tr>
	</table>
</div>
</body>
</html>