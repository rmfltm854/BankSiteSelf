package Captain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Money.money;

public class CaptainDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public CaptainDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Bank";
			String dbID = "root";
			String dbPassword = "mysql";
			Class.forName ("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int CaptainOK(int pw, String id) {
		String sql = "select cpw from captain4 where cid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int pass = rs.getInt(1);
			if(pass == pw) {
				return 1;
			}else {
				return -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int ChangeCaptainPW(int pw, String ID) {
		String sql = "update captain4 set cpw = ? where cid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pw);
			pstmt.setString(2, ID);
			pstmt.executeUpdate();
			return 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<Integer> TotalMoney() {
		String sql = "select money from usermoney";
		List<Integer> money = new ArrayList<Integer>();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(rs);
			while(rs.next()) {
				money.add(rs.getInt(1)); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return money;
	}
	
	public List<money> CheckUser(){
		String sql = "select * from usermoney";
		List<money> user = new ArrayList<money>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(rs);
			while(rs.next()) {
				money MONEY = new money();
				MONEY.setBankNumber(rs.getString(1));
				MONEY.setMoney(rs.getInt(2));
				MONEY.setUserName(rs.getString(3));
				System.out.println(MONEY);
				user.add(MONEY);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}


}
