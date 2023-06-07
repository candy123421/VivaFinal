package web.dto;

import java.util.Date;

public class PackDown {
	
	private int packdownNo;
	private Date packdownDate;
	private int userNo;
	private int packNo;
	
	public PackDown() {	}

	public PackDown(int packdownNo, Date packdownDate, int userNo, int packNo) {
		super();
		this.packdownNo = packdownNo;
		this.packdownDate = packdownDate;
		this.userNo = userNo;
		this.packNo = packNo;
	}

	@Override
	public String toString() {
		return "PackDown [packdownNo=" + packdownNo + ", packdownDate=" + packdownDate + ", userNo=" + userNo
				+ ", packNo=" + packNo + "]";
	}

	public int getPackdownNo() {
		return packdownNo;
	}

	public void setPackdownNo(int packdownNo) {
		this.packdownNo = packdownNo;
	}

	public Date getPackdownDate() {
		return packdownDate;
	}

	public void setPackdownDate(Date packdownDate) {
		this.packdownDate = packdownDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPackNo() {
		return packNo;
	}

	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	
	

}
