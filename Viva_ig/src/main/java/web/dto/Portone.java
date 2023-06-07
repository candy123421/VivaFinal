package web.dto;

public class Portone {
	private int portNo;
	private int apiNo;
	private String payToken;
	private String payment;
	private int dealNo;
	
	public Portone() {	}

	public Portone(int portNo, int apiNo, String payToken, String payment, int dealNo) {
		super();
		this.portNo = portNo;
		this.apiNo = apiNo;
		this.payToken = payToken;
		this.payment = payment;
		this.dealNo = dealNo;
	}

	@Override
	public String toString() {
		return "Portone [portNo=" + portNo + ", apiNo=" + apiNo + ", payToken=" + payToken + ", payment=" + payment
				+ ", dealNo=" + dealNo + "]";
	}

	public int getPortNo() {
		return portNo;
	}

	public void setPortNo(int portNo) {
		this.portNo = portNo;
	}

	public int getApiNo() {
		return apiNo;
	}

	public void setApiNo(int apiNo) {
		this.apiNo = apiNo;
	}

	public String getPayToken() {
		return payToken;
	}

	public void setPayToken(String payToken) {
		this.payToken = payToken;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getDealNo() {
		return dealNo;
	}

	public void setDealNo(int dealNo) {
		this.dealNo = dealNo;
	}
	
	

}
