package web.dto;

import java.util.Date;

public class Comments {

	private int commNo;
	private String commContent;
	private Date commDate;
	private int boardNo;
	private int userNo;
	
	public Comments() {}

	@Override
	public String toString() {
		return "Comments [commNo=" + commNo + ", commContent=" + commContent + ", commDate=" + commDate + ", boardNo="
				+ boardNo + ", userNo=" + userNo + "]";
	}

	public Comments(int commNo, String commContent, Date commDate, int boardNo, int userNo) {
		super();
		this.commNo = commNo;
		this.commContent = commContent;
		this.commDate = commDate;
		this.boardNo = boardNo;
		this.userNo = userNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommDate() {
		return commDate;
	}

	public void setCommDate(Date commDate) {
		this.commDate = commDate;
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
