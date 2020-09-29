<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return;
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName= request.getParameter("productName");
	int productPrice= Integer.parseInt(request.getParameter("productPrice"));;
	String productContent= request.getParameter("productContent");
	String productSoldout= request.getParameter("productSoldout");
	// addProduct 페이지에서 값을 가지고온다.
	
	Product product = new Product();
	product.setCategoryId(categoryId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	// product에 가져온 값을 저장한다.
	
	ProductDao productDao = new ProductDao();
	productDao.insertProduct(product);
	
	response.sendRedirect(request.getContextPath()+"/product/productList.jsp"); 
	// 제품 리스트로 돌아간다.
%>