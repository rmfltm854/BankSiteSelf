package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Money.money;


	public class userDAO {


	
		private Connection conn;//자바 와 MYSQL 데이터베이스 연결
		private PreparedStatement pstmt;//쿼리문 대기 및 설정
		private ResultSet rs;//결과값 받아오기
	
		//기본 생성자
		//UserDAO 가 실행되면 자동으로 생성되는 부분
		//메소드마다 반복되는 코드를 이곳에넣으면 코드간소화 가능!
	
		public userDAO(){
		
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
		public int login(String ID, String PW){
			String sql = "select PW from user2 where ID = ?";
			System.out.println(ID);
			try {
				pstmt = conn.prepareStatement(sql);//sql커리문 대기
				pstmt.setString(1, ID);//1번째 "?"에 매개변수로 받아온 ID를 넣어준다./
				rs = pstmt.executeQuery();//쿼리실행결과를 rs에저장
				if(rs.next()) {
					if(rs.getString(1).equals(PW)) {
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
	
		public int join(user User) {
			String sql = "insert into user2 value(?,?,?,?,?)";
			System.out.println(User.getuserName());
			System.out.println(User.getgender());
			System.out.println(User.getemail());
			
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, User.getuserName());
				pstmt.setString(2, User.getiD());
				pstmt.setString(3, User.getpW());
				pstmt.setString(4, User.getgender());
				pstmt.setString(5, User.getemail());
				return pstmt.executeUpdate();
			}catch (Exception e){
				e.printStackTrace();
			}
			return -1;
		}
		
		public List<money> CheckNumber(String name){
			money MONEY = new money();
			List<money> list = new ArrayList<money>();
			String sql = "select Banknumber from usermoney where username = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					MONEY.setBankNumber(rs.getString(1));
					list.add(MONEY);
					}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return list;
		}	
	}


