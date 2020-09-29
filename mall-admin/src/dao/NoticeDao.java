package dao;
import java.util.*;
import java.sql.*;
import vo.*;
import commons.DBUtil;;

public class NoticeDao {
	public Notice selectNoticeOne(int noticeId) throws Exception {
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT notice_id, notice_title, notice_content, notice_date FROM notice WHERE notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
		}
		return notice;
	}
	public void  updateNotice(Notice notice) throws Exception {
		DBUtil dbUtil = new DBUtil(); // DBUtil 사용
		Connection conn = dbUtil.getConnection(); 
		
		String sql = "update notice set notice_title= ?, notice_content= ? WHERE notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, notice.getNoticeId());
		stmt.executeUpdate();
		conn.close();
	}
	
	public void  deleteNotice(Notice notice) throws Exception {
		DBUtil dbUtil = new DBUtil(); // DBUtil 사용
		Connection conn = dbUtil.getConnection(); 
		
		String sql = "DELETE FROM notice WHERE notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, notice.getNoticeId());
		stmt.executeLargeUpdate();
		conn.close();
	}
	
	public void  insertNotice(Notice notice) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO notice(notice_title, notice_content, notice_date) VALUES(?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.executeLargeUpdate();
		conn.close();
	}
	public ArrayList<Notice> selectNoticeList() throws Exception{ // 공지 보기
		ArrayList<Notice> list = new  ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
			list.add(n);
		}
		conn.close();
		return list;
	}
}
