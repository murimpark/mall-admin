<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")== null) {
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>관리자 메인 페이지</h1>
	<p><%=session.getAttribute("loginAdminId") %>님 반갑습니다.</p>
	<div>이 웹사이트 제작을 위해 eclipse(java)와 톰캣 8.5버전을 사용하고 있으며, mariadb를 이용하여 구현하고 있습니다. </div>
	<div>인터넷 쇼핑몰의 관리자 페이지를 구현하고 있으며, 카테고리와 카테고리 추가기능, 카테고리 하위 제품들과 제품들의 추가기능을 구현하였습니다.</div>
	<div>이 웹사이트는 연습 목적으로 만들어졌으며, 메서드 위주로 연습하고 있습니다.</div>
	</div>
</div>
</body>
</html>