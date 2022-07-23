package Money;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.mysql.cj.Session;

import User.user;


	public class moneyDAO {


	
		private Connection conn;//자바 와 MYSQL 데이터베이스 연결
		private PreparedStatement pstmt;//쿼리문 대기 및 설정
		private ResultSet rs;//결과값 받아오기
		private PreparedStatement pstmt1;
	
		//기본 생성자
		//UserDAO 가 실행되면 자동으로 생성되는 부분
		//메소드마다 반복되는 코드를 이곳에넣으면 코드간소화 가능!
	
		public moneyDAO(){
		
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
		public int CreateBankNum(String BankNum, String UserName){
			String sql = "insert into UserMoney value(?,0,?)";
			System.out.println(BankNum);
			try {
				
				pstmt = conn.prepareStatement(sql);//sql커리문 대기
				pstmt.setString(1, BankNum);
				pstmt.setString(2, UserName);//1번째 "?"에 매개변수로 받아온 ID를 넣어준다./
				return pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
	
		public int Inputmoney(money Money) {
			
			String sql = "select money from usermoney where banknumber = ?";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Money.getBankNumber());
				rs = pstmt.executeQuery();
				System.out.println(rs);
				System.out.println(Money.getBankNumber());
				System.out.println(Money.getMoney());
				rs.next();
				int money = rs.getInt(1);
				System.out.println(money);
				
				String sql1 = "update usermoney set money = ? where banknumber = ?";
				pstmt1 = conn.prepareStatement(sql1);
				pstmt1.setInt(1, money + Money.getMoney());
				pstmt1.setString(2,Money.getBankNumber());
				pstmt1.executeUpdate();
				System.out.println(Money.getMoney());
				return 1;
			}catch (Exception e) {
				e.printStackTrace();
				return -1;
				}
			}
		
		public int findMoney(String money) {
			String sql = "select money from usermoney where banknumber = ?";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, money);
				
				rs = pstmt.executeQuery();
				rs.next();
				int remoney = rs.getInt(1);
				System.out.println(money);
				return remoney;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		}
	}
	
	
			
			
				
				
			
		
			

		
		
	
	
