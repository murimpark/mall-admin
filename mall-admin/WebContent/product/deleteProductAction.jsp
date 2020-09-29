<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
<%
	if(session.getAttribute("loginAdminId")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<%
	// 제품 삭제 액션 jsp입니다.
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	Product product = new Product();
	product.setProductId(productId);
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(product);
	response.sendRedirect(request.getContextPath()+"/product/productList.jsp");
%>