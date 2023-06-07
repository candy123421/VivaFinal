package web.dto;

public class SourceLike {
	
	private int	sourceNo;
	private int	userNo;
	
	public SourceLike() {	}

	public SourceLike(int sourceNo, int userNo) {
		super();
		this.sourceNo = sourceNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Source_like [sourceNo=" + sourceNo + ", userNo=" + userNo + "]";
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
