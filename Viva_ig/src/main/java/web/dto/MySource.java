package web.dto;

public class MySource {
	
	private int listNo;
	private String sourceName;
	private int bpm;
	private String key;
	private int tagNo;
	private int userNo;
	private int packNo;
	private int sourceNo;
	
	public MySource() {	}

	public MySource(int listNo, String sourceName, int bpm, String key, int tagNo, int userNo, int packNo, int sourceNo) {
		super();
		this.listNo = listNo;
		this.sourceName = sourceName;
		this.bpm = bpm;
		this.key = key;
		this.tagNo = tagNo;
		this.userNo = userNo;
		this.packNo = packNo;
		this.sourceNo = sourceNo;
	}
	
	

	@Override
	public String toString() {
		return "MySource [listNo=" + listNo + ", sourceName=" + sourceName + ", bpm=" + bpm + ", key=" + key
				+ ", tagNo=" + tagNo + ", userNo=" + userNo + ", packNo=" + packNo + ", sourceNo=" + sourceNo + "]";
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getSourceName() {
		return sourceName;
	}

	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}

	public int getBpm() {
		return bpm;
	}

	public void setBpm(int bpm) {
		this.bpm = bpm;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPackNo() {
		return packNo;
	}

	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}
	
	

}
