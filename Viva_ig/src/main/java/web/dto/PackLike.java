package web.dto;

public class PackLike {
	
	private int packNo;
	private int userNo;
	
	public PackLike() {}

	@Override
	public String toString() {
		return "PackLike [packNo=" + packNo + ", userNo=" + userNo + "]";
	}

	public PackLike(int packNo, int userNo) {
		super();
		this.packNo = packNo;
		this.userNo = userNo;
	}

	public int getPackNo() {
		return packNo;
	}

	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
