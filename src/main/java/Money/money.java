package Money;

public class money {
	
	private String BankNumber;
	private int Money;
	private String UserName;
	
	public money() {
		
	}
	
	public String getBankNumber() {
		return BankNumber;
	}
	public void setBankNumber(String BankNumber) {
		this.BankNumber = BankNumber;
	}
	public int getMoney() {
		return Money;
	}
	public void setMoney(int Money) {
		this.Money = Money;
	}
	
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	@Override
	public String toString() {
		return "회원정보 : [계좌번호 : " + BankNumber + ",계좌보유 금액 : " + Money + ",사용자 이름 : " + UserName + "]";
	}
	
	
	
	
}
