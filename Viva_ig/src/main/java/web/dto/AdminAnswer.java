package web.dto;

import java.util.Date;

public class AdminAnswer {
	
	private int aNo;
	private String aAnswer;
	private Date aDate;
	private int adminNo;
	private int qNo;
	
	public AdminAnswer() {	}

	public AdminAnswer(int aNo, String aAnswer, Date aDate, int adminNo, int qNo) {
		super();
		this.aNo = aNo;
		this.aAnswer = aAnswer;
		this.aDate = aDate;
		this.adminNo = adminNo;
		this.qNo = qNo;
	}
	
	

	@Override
	public String toString() {
		return "AdminAnswer [aNo=" + aNo + ", aAnswer=" + aAnswer + ", aDate=" + aDate + ", adminNo=" + adminNo
				+ ", qNo=" + qNo + "]";
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaAnswer() {
		return aAnswer;
	}

	public void setaAnswer(String aAnswer) {
		this.aAnswer = aAnswer;
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

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	
	

}
