package web.dto;

import java.util.Date;

public class SourceFileInfo {

	private int uploadNo;
	private String fileOriginname;
	private String fileStoredname;
	private int fileSize;
	private Date sourceDate;
	private int sourceNo;
	
	public SourceFileInfo() {}

	@Override
	public String toString() {
		return "SourceFileInfo [uploadNo=" + uploadNo + ", fileOriginname=" + fileOriginname + ", fileStoredname="
				+ fileStoredname + ", fileSize=" + fileSize + ", sourceDate=" + sourceDate + ", sourceNo=" + sourceNo
				+ "]";
	}

	public SourceFileInfo(int uploadNo, String fileOriginname, String fileStoredname, int fileSize, Date sourceDate,
			int sourceNo) {
		super();
		this.uploadNo = uploadNo;
		this.fileOriginname = fileOriginname;
		this.fileStoredname = fileStoredname;
		this.fileSize = fileSize;
		this.sourceDate = sourceDate;
		this.sourceNo = sourceNo;
	}

	public int getUploadNo() {
		return uploadNo;
	}

	public void setUploadNo(int uploadNo) {
		this.uploadNo = uploadNo;
	}

	public String getFileOriginname() {
		return fileOriginname;
	}

	public void setFileOriginname(String fileOriginname) {
		this.fileOriginname = fileOriginname;
	}

	public String getFileStoredname() {
		return fileStoredname;
	}

	public void setFileStoredname(String fileStoredname) {
		this.fileStoredname = fileStoredname;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getSourceDate() {
		return sourceDate;
	}

	public void setSourceDate(Date sourceDate) {
		this.sourceDate = sourceDate;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	
	
}                         
