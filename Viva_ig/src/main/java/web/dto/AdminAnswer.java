package web.dto;

import java.util.Date;

public class AdminAnswer {
	
	private int aNo;
	private int userNo;
	private String userId;
	private String aAnswer;
	private Date qDate;
	private Date aDate;
	private int adminNo;
	
	public AdminAnswer() {	}

	public AdminAnswer(int aNo, int userNo, String userId, String aAnswer, Date qDate, Date aDate, int adminNo) {
		super();
		this.aNo = aNo;
		this.userNo = userNo;
		this.userId = userId;
		this.aAnswer = aAnswer;
		this.qDate = qDate;
		this.aDate = aDate;
		this.adminNo = adminNo;
	}

	@Override
	public String toString() {
		return "AdminAnswer [aNo=" + aNo + ", userNo=" + userNo + ", userId=" + userId + ", aAnswer=" + aAnswer
				+ ", qDate=" + qDate + ", aDate=" + aDate + ", adminNo=" + adminNo + "]";
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getaAnswer() {
		return aAnswer;
	}

	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	
	
	
	
	

}
