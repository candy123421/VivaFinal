package web.dto;

public class Tag {

	private int tagNo;
	private String instrument;
	private String genre;
	private String scape;
	private String detail;
	private String fx;
	
	public Tag() {}
	

	@Override
	public String toString() {
		return "Tag [tag_no=" + tagNo + ", instrument=" + instrument + ", genre=" + genre + ", scape=" + scape
				+ ", detail=" + detail + ", fx=" + fx + "]";
	}


	public Tag(int tag_no, String instrument, String genre, String scape, String detail, String fx) {
		super();
		this.tagNo = tag_no;
		this.instrument = instrument;
		this.genre = genre;
		this.scape = scape;
		this.detail = detail;
		this.fx = fx;
	}

	public int getTag_no() {
		return tagNo;
	}

	public void setTag_no(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getInstrument() {
		return instrument;
	}

	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getScape() {
		return scape;
	}

	public void setScape(String scape) {
		this.scape = scape;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFx() {
		return fx;
	}

	public void setFx(String fx) {
		this.fx = fx;
	}
	
	
	
}
