package web.dto;

import java.util.Date;

public class DashBoard {
	
	private int dashNo;
	private String dashImg;
	private Date dashDate;
	private int adminNo;
	
	public DashBoard() {	}

	public DashBoard(int dashNo, String dashImg, Date dashDate, int adminNo) {
		super();
		this.dashNo = dashNo;
		this.dashImg = dashImg;
		this.dashDate = dashDate;
		this.adminNo = adminNo;
	}

	@Override
	public String toString() {
		return "DashBoard [dashNo=" + dashNo + ", dashImg=" + dashImg + ", dashDate=" + dashDate + ", adminNo="
				+ adminNo + "]";
	}

	public int getDashNo() {
		return dashNo;
	}

	public void setDashNo(int dashNo) {
		this.dashNo = dashNo;
	}

	public String getDashImg() {
		return dashImg;
	}

	public void setDashImg(String dashImg) {
		this.dashImg = dashImg;
	}

	public Date getDashDate() {
		return dashDate;
	}

	public void setDashDate(Date dashDate) {
		this.dashDate = dashDate;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	
	
	

}
