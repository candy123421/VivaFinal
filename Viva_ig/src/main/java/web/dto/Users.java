package web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Users {

	private int userNo;
	private String userId;
	private String userPw;
	private String userNick;
	private String userGrade;
	private String userProfile;
	private String userName;
	
	//DTO로 전달파라미터를 처리할 때 java.util.date타입에 대한 변환 설정
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userBirth;
	private String userEmail;
	private String userMobile;
	private Date userJoindate;
	private Date userOutdate;
	private Date userLog;
	private String kakaoId;
	
	public Users() {}

	
	
	public Users(int userNo, String userId, String userPw, String userNick, String userGrade, String userProfile,
			String userName, Date userBirth, String userEmail, String userMobile, Date userJoindate, Date userOutdate,
			Date userLog, String kakaoId) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userNick = userNick;
		this.userGrade = userGrade;
		this.userProfile = userProfile;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userMobile = userMobile;
		this.userJoindate = userJoindate;
		this.userOutdate = userOutdate;
		this.userLog = userLog;
		this.kakaoId = kakaoId;
	}



	@Override
	public String toString() {
		return "Users [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userNick=" + userNick
				+ ", userGrade=" + userGrade + ", userProfile=" + userProfile + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userEmail=" + userEmail + ", userMobile=" + userMobile
				+ ", userJoindate=" + userJoindate + ", userOutdate=" + userOutdate + ", userLog=" + userLog
				+ ", kakaoId=" + kakaoId + "]";
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



	public String getUserPw() {
		return userPw;
	}



	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}



	public String getUserNick() {
		return userNick;
	}



	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}



	public String getUserGrade() {
		return userGrade;
	}



	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}



	public String getUserProfile() {
		return userProfile;
	}



	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public Date getUserBirth() {
		return userBirth;
	}



	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public String getUserMobile() {
		return userMobile;
	}



	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}



	public Date getUserJoindate() {
		return userJoindate;
	}



	public void setUserJoindate(Date userJoindate) {
		this.userJoindate = userJoindate;
	}



	public Date getUserOutdate() {
		return userOutdate;
	}



	public void setUserOutdate(Date userOutdate) {
		this.userOutdate = userOutdate;
	}



	public Date getUserLog() {
		return userLog;
	}



	public void setUserLog(Date userLog) {
		this.userLog = userLog;
	}



	public String getKakaoId() {
		return kakaoId;
	}



	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	
	
	
	
	
	
}                               
