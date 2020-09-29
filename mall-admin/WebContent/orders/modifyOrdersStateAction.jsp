<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" import="dao.*" import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	String ordersState = request.getParameter("ordersState");
	
	Orders orders = new Orders();
	orders.setOrdersId(ordersId);
	orders.setOrdersState(ordersState);
	
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersState(orders);
	
	response.sendRedirect(request.getContextPath()+"/orders/ordersList.jsp?ordersId="+ordersId);
%>