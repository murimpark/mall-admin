package dao;
import vo.*;
import commons.*;
import java.util.*;
import java.sql.*;
/*
 * Orders의 데이터 액세스 오브젝트 (DAO)
 */
public class OrdersDao {
	public void updateOrdersState(Orders orders) throws Exception { // 주문 리스트 상태 수정
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE orders SET orders_state= ? WHERE orders_id= ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(orders.getOrdersState().equals("")) {
			stmt.setString(1, "결재완료");
		} else {
			stmt.setString(1, orders.getOrdersState());
		}
		stmt.setInt(2, orders.getOrdersId());
		stmt.executeUpdate();
		conn.close();
	}
	public Orders selectOrderOne(int ordersId) throws Exception { // 미완성 주문 상태 상세보기
		Orders orders = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECET orders_id, orders_state FROM orders WHERE orders_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ordersId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			orders = new Orders();
			orders.setOrdersId(rs.getInt("orders_id"));
			orders.setOrdersState(rs.getNString("orders_state"));
		}
		return orders;
	}
	public ArrayList<String> selectOrdersStateListByOrdersId(int ordersId) throws Exception{ // 주문리스트의 상태 정렬
		//select distinct ordersState from orders
		ArrayList<String> list = new  ArrayList<String>(); //리턴값을 보낼 리스트 생성
		
		DBUtil dbUtil = new DBUtil(); //dbutil 생성
		Connection conn = dbUtil.getConnection(); //conn에 getConnect() 메서드 삽입
		
		String sql = "SELECT DISTINCT orders_state FROM orders WHERE orders_id= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ordersId);
		ResultSet rs = stmt.executeQuery();

		while(rs.next()) {
			list.add(rs.getString("orders_state"));
		}
		conn.close();
		return list;
	}
	
	public ArrayList<String> selectOrdersStateList() throws Exception{ // 주문리스트의 상태 정렬
		//select distinct ordersState from orders
		ArrayList<String> list = new  ArrayList<String>(); //리턴값을 보낼 리스트 생성
		
		DBUtil dbUtil = new DBUtil(); //dbutil 생성
		Connection conn = dbUtil.getConnection(); //conn에 getConnect() 메서드 삽입
		
		String sql = "SELECT DISTINCT orders_state FROM orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while(rs.next()) {
			list.add(rs.getString("orders_state"));
		}
		conn.close();
		return list;
	}
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{ // 주문리스트 셀렉트
		ArrayList<OrdersAndProduct> list = new  ArrayList<OrdersAndProduct>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	
		String sql = "SELECT o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name FROM orders AS o INNER JOIN product AS p ON o.product_id = p.product_id";		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId(rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			
			oap.product.setProductName(rs.getString("p.product_name"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{ // 주문리스트의 상태 셀렉트 
		ArrayList<OrdersAndProduct> list = new  ArrayList<OrdersAndProduct>();

		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name FROM orders o INNER JOIN product p ON o.product_id=p.product_id WHERE o.orders_state= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId(rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			
			oap.product.setProductName(rs.getString("p.product_name"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
}