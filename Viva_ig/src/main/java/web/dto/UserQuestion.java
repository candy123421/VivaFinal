package web.dto;

import java.util.Date;

public class UserQuestion {
	
	private int qNo;
	private String qContent;
	private String qProcess;
	private Date qDate;
	private String qTitle;
	private int userNo;
	private int aNo;
	
	public UserQuestion() {	}

	public UserQuestion(int qNo, String qContent, String qProcess, Date qDate, String qTitle, int userNo, int aNo) {
		super();
		this.qNo = qNo;
		this.qContent = qContent;
		this.qProcess = qProcess;
		this.qDate = qDate;
		this.qTitle = qTitle;
		this.userNo = userNo;
		this.aNo = aNo;
	}

	@Override
	public String toString() {
		return "UserQuestion [qNo=" + qNo + ", qContent=" + qContent + ", qProcess=" + qProcess + ", qDate=" + qDate
				+ ", qTitle=" + qTitle + ", userNo=" + userNo + ", aNo=" + aNo + "]";
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqProcess() {
		return qProcess;
	}

	public void setqProcess(String qProcess) {
		this.qProcess = qProcess;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	
	

}
