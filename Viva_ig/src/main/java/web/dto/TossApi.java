package web.dto;

import java.sql.Timestamp;
import java.util.Date;

public class TossApi {
	
	private int tossNo;
	private int dealNo;
	private int userNo;
	private String orderId;
	private String paymentKey;
	private String method;
	private int totalAmount;
	private String card;
	private String transfer;
	private String phone;
	private Timestamp approvedAt;
	
	public TossApi() {}

	public TossApi(int tossNo, int dealNo, int userNo, String orderId, String paymentKey, String method,
			int totalAmount, String card, String transfer, String phone, String requestedAt, Timestamp approvedAt) {
		super();
		this.tossNo = tossNo;
		this.dealNo = dealNo;
		this.userNo = userNo;
		this.orderId = orderId;
		this.paymentKey = paymentKey;
		this.method = method;
		this.totalAmount = totalAmount;
		this.card = card;
		this.transfer = transfer;
		this.phone = phone;
		this.approvedAt = approvedAt;
	}

	@Override
	public String toString() {
		return "TossApi [tossNo=" + tossNo + ", dealNo=" + dealNo + ", userNo=" + userNo + ", orderId=" + orderId
				+ ", paymentKey=" + paymentKey + ", method=" + method + ", totalAmount=" + totalAmount + ", card="
				+ card + ", transfer=" + transfer + ", phone=" + phone +  "approvedAt=" + approvedAt + "]";
	}

	public int getTossNo() {
		return tossNo;
	}

	public void setTossNo(int tossNo) {
		this.tossNo = tossNo;
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

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getPaymentKey() {
		return paymentKey;
	}

	public void setPaymentKey(String paymentKey) {
		this.paymentKey = paymentKey;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getApprovedAt() {
		return approvedAt;
	}

	public void setApprovedAt(Timestamp chargeTime) {
		this.approvedAt = chargeTime;
	}


}
