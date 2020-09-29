package dao;
import java.util.ArrayList;
import java.sql.*;
import vo.*;
import commons.*;
public class CategoryDao {
	//Category 수정 메서드
	public void  updateCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil(); // DBUtil 사용
		Connection conn = dbUtil.getConnection(); 
		
		String sql = "update category set category_name = ? where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, category.getCategoryName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeUpdate();
		conn.close();
	}
	
	//Category 삭제 메서드
	public void  deleteCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil(); // DBUtil 사용
		Connection conn = dbUtil.getConnection(); 
		
		String sql = "DELETE FROM category WHERE category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, category.getCategoryId());
		stmt.executeLargeUpdate();
		conn.close();
	}

	//Category 추가 메서드
	public void  insertCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, category.getCategoryName());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//CategoryOne 목록 메서드
	public Category selectCategoryOne(int categoryId) throws Exception {
		Category category = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT category_id, category_name FROM category where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
		}
		conn.close();
		return category;
	}
	
	//Category 목록 메서드
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new  ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn =dbUtil.getConnection();
		
		String sql = "SELECT category_id, category_name FROM category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
}
