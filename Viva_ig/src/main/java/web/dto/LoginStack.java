package web.dto;

import java.util.Date;

public class LoginStack { ;
	private int loginCount;
	private int userNo;
	private Date loginDate ;
	
	public LoginStack() {	}

	public LoginStack(int loginCount, int userNo, Date loginDate) {
		super();
		this.loginCount = loginCount;
		this.userNo = userNo;
		this.loginDate = loginDate;
	}

	@Override
	public String toString() {
		return "LoginStack [loginCount=" + loginCount + ", userNo=" + userNo + ", loginDate=" + loginDate + "]";
	}

	public int getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
                         
	
}                         
                         