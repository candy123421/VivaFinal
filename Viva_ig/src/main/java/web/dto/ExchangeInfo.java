package web.dto;

public class ExchangeInfo {
	private int exNo;
	private String holder;
	private String bank;
	private int accNo;
	private String admTransfer;
	private int userNo;
	
	public ExchangeInfo() {	}
	
	public ExchangeInfo(int exNo, String holder, String bank, int accNo, String admTransfer, int userNo) {
		super();
		this.exNo = exNo;
		this.holder = holder;
		this.bank = bank;
		this.accNo = accNo;
		this.admTransfer = admTransfer;
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "ExchangeInfo [exNo=" + exNo + ", holder=" + holder + ", bank=" + bank + ", accNo=" + accNo
				+ ", admTransfer=" + admTransfer + ", userNo=" + userNo + "]";
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

	public int getAccNo() {
		return accNo;
	}

	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}

	public String getAdmTransfer() {
		return admTransfer;
	}

	public void setAdmTransfer(String admTransfer) {
		this.admTransfer = admTransfer;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	

}
