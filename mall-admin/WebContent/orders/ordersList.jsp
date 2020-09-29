<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" import="vo.*" import="dao.*"%>
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
<title>orderList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		String ordersState= "";
		
		if(request.getParameter("ordersState") != null) {
			ordersState = request.getParameter("ordersState");
		} else {
			ordersState = "";
		}
		OrdersDao ordersDao = new OrdersDao();
		
		ArrayList<OrdersAndProduct> list = null;
		if(ordersState.equals("")) {
			list = ordersDao.selectOrdersList();
		} else {
			list = ordersDao.selectOrdersListByState(ordersState);
		}
		ArrayList<String> stateList = ordersDao.selectOrdersStateList();
		
		System.out.println(ordersState);
	%>
	<h1>주문 목록</h1>
	<form action="<%=request.getContextPath() %>/orders/ordersList.jsp?ordersState=<%=ordersState%>" method="post">
		<select name="ordersState">
			<option value="">선택</option>
			<%
				for(String s : stateList) {
			%>
						<option value="<%=s %>"><%=s %></option>
						
			<%
				}
			%>
		</select>
		<button type="submit">주문상태별로 보기</button>
	</form>
	<table class="table">
		<thead>
			<tr>
				<td>orders_id</td>
				<td>product_id</td>
				<td>product_name</td>
				<td>orders_amount</td>
				<td>orders_price</td>
				<td>member_email</td>
				<td>orders_addr</td>
				<td>orders_state</td>
				<td>orders_date</td>
				<td>상태 수정</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : list) {
			%>
			<tr>
				<td><%=oap.orders.getOrdersId() %></td>
				<td><%=oap.orders.getProductId() %></td>
				<td><%=oap.product.getProductName() %></td>
				<td><%=oap.orders.getOrdersAmount() %></td>
				<td><%=oap.orders.getOrdersPrice() %></td>
				<td><%=oap.orders.getMemberEmail() %></td>
				<td><%=oap.orders.getOrdersAddr() %></td>
				<td><%=oap.orders.getOrdersState() %></td>
				<td><%=oap.orders.getOrdersDate() %></td>
				<td><a href="<%=request.getContextPath() %>/orders/modifyOrdersState.jsp?ordersId=<%=oap.orders.getOrdersId()%>&ordersState=<%=oap.orders.getOrdersState()%>">상태 수정</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>