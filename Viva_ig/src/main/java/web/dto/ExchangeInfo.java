package web.dto;

import java.util.Date;

public class ExchangeInfo {
	private int exNo;
	private String holder;
	private String bank;	//은행명
	private String accNo;		//계좌번호. int형으로 하면 10자리 넘어서면 오류 나서 String 형으로 변환.
	private int exAmount;	//환전요청한 실제 금액
	private String admTransfer;	//관리자 처리여부. 디폴트 N 임.
	private Date exDate;	//환전요청시간. 디폴트 current_timestamp 임.
	private int dealNo;		//크레딧 테이블의 dealNo... 
	private int userNo;
	
	
	public ExchangeInfo() {}


	public ExchangeInfo(int exNo, String holder, String bank, String accNo, int exAmount, String admTransfer,
			Date exDate, int dealNo, int userNo) {
		super();
		this.exNo = exNo;
		this.holder = holder;
		this.bank = bank;
		this.accNo = accNo;
		this.exAmount = exAmount;
		this.admTransfer = admTransfer;
		this.exDate = exDate;
		this.dealNo = dealNo;
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "ExchangeInfo [exNo=" + exNo + ", holder=" + holder + ", bank=" + bank + ", accNo=" + accNo
				+ ", exAmount=" + exAmount + ", admTransfer=" + admTransfer + ", exDate=" + exDate + ", dealNo="
				+ dealNo + ", userNo=" + userNo + "]";
	}


	public int getExNo() {
		return exNo;
	}


	public void setExNo(int exNo) {
		this.exNo = exNo;
	}


	public String getHolder() {
		return holder;
	}


	public void setHolder(String holder) {
		this.holder = holder;
	}


	public String getBank() {
		return bank;
	}


	public void setBank(String bank) {
		this.bank = bank;
	}


	public String getAccNo() {
		return accNo;
	}


	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}


	public int getExAmount() {
		return exAmount;
	}


	public void setExAmount(int exAmount) {
		this.exAmount = exAmount;
	}


	public String getAdmTransfer() {
		return admTransfer;
	}


	public void setAdmTransfer(String admTransfer) {
		this.admTransfer = admTransfer;
	}


	public Date getExDate() {
		return exDate;
	}


	public void setExDate(Date exDate) {
		this.exDate = exDate;
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

	


}
