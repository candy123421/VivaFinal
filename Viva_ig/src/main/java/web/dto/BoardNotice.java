package web.dto;

import java.util.Date;

public class BoardNotice {
	
	private int oticeNo;
	private String oticeTitle;
	private String oticeContent;
	private Date oticeDate;
	private int dminNo;
	
	public BoardNotice() {	}

	public BoardNotice(int oticeNo, String oticeTitle, String oticeContent, Date oticeDate, int dminNo) {
		super();
		this.oticeNo = oticeNo;
		this.oticeTitle = oticeTitle;
		this.oticeContent = oticeContent;
		this.oticeDate = oticeDate;
		this.dminNo = dminNo;
	}

	@Override
	public String toString() {
		return "BoardNotice [oticeNo=" + oticeNo + ", oticeTitle=" + oticeTitle + ", oticeContent=" + oticeContent
				+ ", oticeDate=" + oticeDate + ", dminNo=" + dminNo + "]";
	}

	public int getOticeNo() {
		return oticeNo;
	}

	public void setOticeNo(int oticeNo) {
		this.oticeNo = oticeNo;
	}

	public String getOticeTitle() {
		return oticeTitle;
	}

	public void setOticeTitle(String oticeTitle) {
		this.oticeTitle = oticeTitle;
	}

	public String getOticeContent() {
		return oticeContent;
	}

	public void setOticeContent(String oticeContent) {
		this.oticeContent = oticeContent;
	}

	public Date getOticeDate() {
		return oticeDate;
	}

	public void setOticeDate(Date oticeDate) {
		this.oticeDate = oticeDate;
	}

	public int getDminNo() {
		return dminNo;
	}

	public void setDminNo(int dminNo) {
		this.dminNo = dminNo;
	}
	
	

}
