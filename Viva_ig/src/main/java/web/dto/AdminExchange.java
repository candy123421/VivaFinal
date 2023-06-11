package web.dto;

import java.util.Date;

public class AdminExchange {
	
	private int admExNo;
	private int exNo;
	private int adminNo;
	private Date admExDate;
	
	public AdminExchange() {}

	public AdminExchange(int admExNo, int exNo, int adminNo, Date admExDate) {
		super();
		this.admExNo = admExNo;
		this.exNo = exNo;
		this.adminNo = adminNo;
		this.admExDate = admExDate;
	}

	@Override
	public String toString() {
		return "AdminExchange [admExNo=" + admExNo + ", exNo=" + exNo + ", adminNo=" + adminNo + ", admExDate="
				+ admExDate + "]";
	}

	public int getAdmExNo() {
		return admExNo;
	}

	public void setAdmExNo(int admExNo) {
		this.admExNo = admExNo;
	}

	public int getExNo() {
		return exNo;
	}

	public void setExNo(int exNo) {
		this.exNo = exNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public Date getAdmExDate() {
		return admExDate;
	}

	public void setAdmExDate(Date admExDate) {
		this.admExDate = admExDate;
	}
	

}
