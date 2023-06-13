package web.dto;

import java.util.Date;

public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String categoryType;
	private int boardHit;
	private int boardLike;
	private int userNo;
	private String userId;
	private int likeCount;
	
	
	public Board() {}

	
	public Board(int boardNo, String boardTitle, String boardContent, Date boardDate, String categoryType, int boardHit,
			int boardLike, int userNo, String userId, int likeCount) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.categoryType = categoryType;
		this.boardHit = boardHit;
		this.boardLike = boardLike;
		this.userNo = userNo;
		this.userId = userId;
		this.likeCount = likeCount;
	}

	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", categoryType=" + categoryType + ", boardHit=" + boardHit
				+ ", boardLike=" + boardLike + ", userNo=" + userNo + ", userId=" + userId + ", likeCount=" + likeCount
				+ "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public int getBoardLike() {
		return boardLike;
	}

	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
