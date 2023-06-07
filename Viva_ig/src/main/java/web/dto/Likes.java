package web.dto;

public class Likes {

	private int boardNo;
	private int userNo;
	
	public Likes() {}

	@Override
	public String toString() {
		return "Likes [boardNo=" + boardNo + ", userNo=" + userNo + "]";
	}

	public Likes(int boardNo, int userNo) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
}
