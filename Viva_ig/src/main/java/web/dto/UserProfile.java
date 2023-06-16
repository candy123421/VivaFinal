package web.dto;

public class UserProfile {

	private int profileFileno;
	private String originname;
	private String storedname;
	private int filesize;
	private int userNo;
	
	public UserProfile() {}

	public UserProfile(int profileFileno, String originname, String storedname, int filesize, int userNo) {
		super();
		this.profileFileno = profileFileno;
		this.originname = originname;
		this.storedname = storedname;
		this.filesize = filesize;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "UserProfile [profileFileno=" + profileFileno + ", originname=" + originname + ", storedname="
				+ storedname + ", filesize=" + filesize + ", userNo=" + userNo + "]";
	}

	public int getProfileFileno() {
		return profileFileno;
	}

	public void setProfileFileno(int profileFileno) {
		this.profileFileno = profileFileno;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getStoredname() {
		return storedname;
	}

	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
}
