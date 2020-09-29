<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>
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
<title>addCategory</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		String ordersState = request.getParameter("ordersState");
		
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<String> stateList = ordersDao.selectOrdersStateListByOrdersId(ordersId);
	%>
	
	<h1>상태 수정</h1>
	<form action="<%=request.getContextPath() %>/orders/modifyOrdersStateAction.jsp" method="post">
		<div>상태 수정</div>
		<input type="hidden" name="ordersId" value="<%=ordersId%>">
		<div>		<select name="ordersState">
			<option value="">선택</option>
			<%
				for(String s : stateList) {
			%>
						<option 
						<%
							if(ordersState.equals(s)) {
								%>
								value="<%=s %>" selected="selected"
								<% 
							} else {
								%>
								value="<%=s %>"
								<%
							}
						%>
						><%=s %></option>
			<%
				}
			%>
		</select></div>
		<div><button class="btn btn-success" type="submit">상태 수정</button></div>
	</form>
</div>
</body>
</html>