package web.dto;

public class Cart {
	
	private int cartNo;
	private int sourceNo;
	private int userNo;
	
	public Cart() {	}

	public Cart(int cartNo, int sourceNo, int userNo) {
		super();
		this.cartNo = cartNo;
		this.sourceNo = sourceNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", sourceNo=" + sourceNo + ", userNo=" + userNo + "]";
	}

	
	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	
	
	
	

}
