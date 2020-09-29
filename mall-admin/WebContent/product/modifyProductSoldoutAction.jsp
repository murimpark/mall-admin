<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*"%>
<%
	if(session.getAttribute("loginAdminId")== null) { // admin아이디가 로그인이 되어있지 않다면
		response.sendRedirect(request.getContextPath()+"/login.jsp"); // login페이지로 돌아가시오
		return;
	}
%>
<% 
	// 제품 상태 변경액션입니다.
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productSoldout = request.getParameter("productSoldout");
	ProductDao productDao = new ProductDao();
	productDao.updateProductSoldout(productId, productSoldout);
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+productId);
%>