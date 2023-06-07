package web.dto;

public class SourceImgInfo {

	private String sourceImgOriginname;
	private String sourceImgStoredname;
	private int sourceNo;
	
	public SourceImgInfo() {}

	public SourceImgInfo(String sourceImgOriginname, String sourceImgStoredname, int sourceNo) {
		super();
		this.sourceImgOriginname = sourceImgOriginname;
		this.sourceImgStoredname = sourceImgStoredname;
		this.sourceNo = sourceNo;
	}

	@Override
	public String toString() {
		return "SourceImgInfo [sourceImgOriginname=" + sourceImgOriginname + ", sourceImgStoredname="
				+ sourceImgStoredname + ", sourceNo=" + sourceNo + "]";
	}

	public String getSourceImgOriginname() {
		return sourceImgOriginname;
	}

	public void setSourceImgOriginname(String sourceImgOriginname) {
		this.sourceImgOriginname = sourceImgOriginname;
	}

	public String getSourceImgStoredname() {
		return sourceImgStoredname;
	}

	public void setSourceImgStoredname(String sourceImgStoredname) {
		this.sourceImgStoredname = sourceImgStoredname;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}
	
	
	
	
	
}
