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
	private Timestamp approvedAt;
	
	public TossApi() {}

	public TossApi(int tossNo, int dealNo, int userNo, String orderId, String paymentKey, String method,
			int totalAmount, Timestamp approvedAt) {
		super();
		this.tossNo = tossNo;
		this.dealNo = dealNo;
		this.userNo = userNo;
		this.orderId = orderId;
		this.paymentKey = paymentKey;
		this.method = method;
		this.totalAmount = totalAmount;
		this.approvedAt = approvedAt;
	}

	@Override
	public String toString() {
		return "TossApi [tossNo=" + tossNo + ", dealNo=" + dealNo + ", userNo=" + userNo + ", orderId=" + orderId
				+ ", paymentKey=" + paymentKey + ", method=" + method + ", totalAmount=" + totalAmount + ", approvedAt="
				+ approvedAt + "]";
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

	public Timestamp getApprovedAt() {
		return approvedAt;
	}

	public void setApprovedAt(Timestamp approvedAt) {
		this.approvedAt = approvedAt;
	}


}
