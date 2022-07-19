package BBS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class bbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	//기본생성자
	
	public bbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/boardpractice1";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName ("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";//데이터베이스 오류
	}
	
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장마지막 글의 번호를 구한다.
		String sql = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;//첫번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String sql = "insert into bbs values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //글의 유효번호
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	//게시글 리스트 메소드
	public ArrayList<bbs> getList(int pageNumber){
		String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<bbs> list = new ArrayList<bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbs BBS = new bbs();
				BBS.setBbsID(rs.getInt(1));
				BBS.setBbsTitle(rs.getString(2));
				BBS.setUserID(rs.getString(3));
				BBS.setBbsDate(rs.getString(4));
				BBS.setBbsContent(rs.getString(5));
				BBS.setBbsAvailable(rs.getInt(6));
				list.add(BBS);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//페이징 처리 메소드
	public boolean nextPage(int pageNumber) {
		String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext() - (pageNumber - 1)*10);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return true;
				}
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//하나의 게시글을 보는 메소드
	public bbs getBbs(int bbsID) {
		String sql = "select * from bbs where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bbs BBS = new bbs();
				BBS.setBbsID(rs.getInt(1));
				BBS.setBbsTitle(rs.getString(2));
				BBS.setUserID(rs.getString(3));
				BBS.setBbsDate(rs.getString(4));
				BBS.setBbsContent(rs.getString(5));
				BBS.setBbsAvailable(rs.getInt(6));
				return BBS;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 수정메소드
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String sql = "update bbs set bbsTitle = ?,bbsContent = ? where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	//게시글삭제 메소드
	public int delete(int bbsID) {
		//실제데이터를 삭제하는것이아니라 게시글 유효숫자를 '0'으로 수정하는로직인데 사용자눈에 안보이게만 처리하는 로직이다.
		String sql = "update bbs set bbsAvailable = 0 where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bbsID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

}
