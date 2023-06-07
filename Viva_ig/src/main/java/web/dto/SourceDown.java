package web.dto;

import java.util.Date;

public class SourceDown {
	
	private int sourcedownNo;
	private Date sourcedownDate;
	private int userNo;
	private int sourceNo;
	
	public SourceDown() {	}

	public SourceDown(int sourcedownNo, Date sourcedownDate, int userNo, int sourceNo) {
		super();
		this.sourcedownNo = sourcedownNo;
		this.sourcedownDate = sourcedownDate;
		this.userNo = userNo;
		this.sourceNo = sourceNo;
	}

	@Override
	public String toString() {
		return "SourceDown [sourcedownNo=" + sourcedownNo + ", sourcedownDate=" + sourcedownDate + ", userNo=" + userNo
				+ ", sourceNo=" + sourceNo + "]";
	}

	public int getSourcedownNo() {
		return sourcedownNo;
	}

	public void setSourcedownNo(int sourcedownNo) {
		this.sourcedownNo = sourcedownNo;
	}

	public Date getSourcedownDate() {
		return sourcedownDate;
	}

	public void setSourcedownDate(Date sourcedownDate) {
		this.sourcedownDate = sourcedownDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}
	
	

}
