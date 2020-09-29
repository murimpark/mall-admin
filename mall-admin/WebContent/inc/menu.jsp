<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  

<nav class="navbar navbar-expand-sm bg-dark">
<div class="btn-group">
<ul class="navbar-nav">
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/index.jsp">[홈으로]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/category/categoryList.jsp">[상품카테고리 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/product/productList.jsp">[상품 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/orders/ordersList.jsp">[주문 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/notice/noticeList.jsp">[공지 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/member/memberList.jsp">[회원 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link btn btn-secondary" href="<%=request.getContextPath() %>/logoutAction.jsp">로그아웃</a>
	</li>
</ul>
</div>
</nav>