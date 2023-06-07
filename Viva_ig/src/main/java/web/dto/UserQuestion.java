package web.dto;

import java.util.Date;

public class UserQuestion {
	
	private int qNo;
	private String qTitle;
	private String qContent;
	private String qProcess;
	private Date qDate;
	private int userNo;
	
	public UserQuestion() {	}

	public UserQuestion(int qNo, String qTitle, String qContent, String qProcess, Date qDate, int userNo) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qProcess = qProcess;
		this.qDate = qDate;
		this.userNo = userNo;
	}
	
	

	@Override
	public String toString() {
		return "UserQuestion [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qProcess=" + qProcess
				+ ", qDate=" + qDate + ", userNo=" + userNo + "]";
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
}
