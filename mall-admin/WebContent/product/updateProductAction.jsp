<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" import="dao.*"%>
<%
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return;
	}
%>
<%
	// 제품 수정 액션 입니다.
	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId")); 
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName= request.getParameter("productName");
	int productPrice= Integer.parseInt(request.getParameter("productPrice"));;
	String productContent= request.getParameter("productContent");
	String productSoldout= request.getParameter("productSoldout");
	
	Product product = new Product();
	product.setProductId(productId);
	product.setCategoryId(categoryId);
	product.setProductName(productName);
	product.setProductPrice(productPrice);
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	
	System.out.println(productId);
	System.out.println(categoryId);
	System.out.println(productName);
	System.out.println(productPrice);
	System.out.println(productContent);
	System.out.println(productSoldout);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product);
	
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+productId);
%>