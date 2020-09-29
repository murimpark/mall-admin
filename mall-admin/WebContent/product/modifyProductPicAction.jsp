<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="vo.*" import="dao.*" %>
<%
/*
	1. 상품아이디와 이미지 파일을 받음 
	2. 이미지 파일을 서버 /image폴더에 새로운 이름으로 저장
	3. 저장된 이미지의 이름을 상품테이블에서 수정한다.
*/
// 	String productId = request.getParameter("productId");
// 	String productPic = request.getParameter("productPic");
// 	System.out.println(productId);
// 	System.out.println(productPic);
	
	int size = 1024 * 1024 * 100;
	String imagePath = application.getRealPath("image"); //실제경로
	MultipartRequest multi = new MultipartRequest(request, imagePath, size, "utf-8", new DefaultFileRenamePolicy());
	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId);
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")); //시스템 파일이름
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	response.sendRedirect(request.getContextPath() + "/product/productOne.jsp?productId="+productId);
%> 