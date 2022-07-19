package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;//자바 와 MYSQL 데이터베이스 연결
	private PreparedStatement pstmt;//쿼리문 대기 및 설정
	private ResultSet rs;//결과값 받아오기
	
	//기본 생성자
	//UserDAO 가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에넣으면 코드간소화 가능!
	
	public UserDAO(){
		
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
	
	public int login(String user_id, String user_pw){
		String sql = "select user_pw from user where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);//sql커리문 대기
			pstmt.setString(1, user_id);//1번째 "?"에 매개변수로 받아온 user_id를 넣어준다./
			rs = pstmt.executeQuery();//쿼리실행결과를 rs에저장
			if(rs.next()) {
				if(rs.getString(1).equals(user_pw)) {
					return 1;//로그인성공
				}else
					return 0;//비밀번호 틀림
				
			}
			return -1;//아이디 없음
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;//오류
	}
	
	public int join(User user) {
		String sql = "insert into user value(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getUser_gender());
			pstmt.setString(5, user.getUser_email());
			return pstmt.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
