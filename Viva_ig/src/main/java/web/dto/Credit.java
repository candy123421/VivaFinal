package web.dto;

import java.util.Date;

public class Credit {
	private int dealNo;
	private int userNo;
	private Date dealDate;
	private int dealCategory;
	private int amount;
	
	public Credit() {	}

	public Credit(int dealNo, int userNo, Date dealDate, int dealCategory, int amount) {
		super();
		this.dealNo = dealNo;
		this.userNo = userNo;
		this.dealDate = dealDate;
		this.dealCategory = dealCategory;
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Credit [dealNo=" + dealNo + ", userNo=" + userNo + ", dealDate=" + dealDate + ", dealCategory="
				+ dealCategory + ", amount=" + amount + "]";
	}

	public int getDealNo() {
		return dealNo;
	}

	public void setDealNo(int dealNo) {
		this.dealNo = dealNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getDealDate() {
		return dealDate;
	}

	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}

	public int getDealCategory() {
		return dealCategory;
	}

	public void setDealCategory(int dealCategory) {
		this.dealCategory = dealCategory;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	

}
