package dao;
import java.sql.*;
import java.util.*;

import commons.DBUtil;
import vo.*;

public class ProductDao {
	public void  deleteProduct(Product product) throws Exception { // 제품 삭제
		DBUtil dbUtil = new DBUtil(); // DBUtil 사용
		Connection conn = dbUtil.getConnection(); 
		
		String sql = "DELETE FROM product WHERE product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getProductId());
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	public void updateProductPic(Product product) throws Exception { // 그림 수정
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE product SET product_pic= ? WHERE product_id= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductPic());
		stmt.setInt(2, product.getProductId());
	
		stmt.executeUpdate();
		conn.close();
	}
	
	public void updateProduct(Product product) throws Exception { // 제품 수정
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE product SET category_id= ?, product_name= ?, product_price= ?, product_content= ?, product_soldout= ? WHERE product_id= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.setInt(6, product.getProductId());
		
		System.out.println(product.getCategoryId());
		System.out.println(product.getProductName());
		System.out.println(product.getProductPrice());
		System.out.println(product.getProductContent());
		System.out.println(product.getProductSoldout());
		System.out.println(product.getProductId());
	
		stmt.executeUpdate();
		conn.close();
	}
	
	public void updateProductSoldout(int productId, String productSoldout) throws Exception {
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update product set product_soldout = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1,"N");
		} else {
			stmt.setString(1,"Y");
		}
		stmt.setInt(2, productId);
		stmt.executeUpdate();
		conn.close();
	}
	
	public Product selectProductOne (int productId) throws Exception {
		Product product = null;

		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT product_id,category_id,product_name,product_price,product_content,product_soldout FROM product WHERE product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setCategoryId(rs.getInt("category_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductContent(rs.getString("product_content"));
			product.setProductSoldout(rs.getString("product_soldout"));
		}
		conn.close();
		return product;
	}
	
	public void insertProduct(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO product(category_id, product_name, product_price, product_content, product_soldout) values(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeUpdate();
		conn.close();
	}
	
	public ArrayList<Product> selectProductListByCategoryId(int categoryId) throws Exception  {
		ArrayList<Product> list = new  ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT product_id, category_id, product_name, product_price, product_soldout FROM product WHERE category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<Product> selectProductList() throws Exception  { 
		ArrayList<Product> list = new  ArrayList<Product>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT product_id, category_id, product_name, product_price, product_soldout FROM product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
}
