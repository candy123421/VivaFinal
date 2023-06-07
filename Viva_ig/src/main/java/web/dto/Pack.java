package web.dto;

import java.util.Date;

public class Pack {

private int packNo;       
private String packName;     
private String packContent;  
private Date packDate;     
private int tagNo;        

public Pack() {}

public Pack(int packNo, String packName, String packContent, Date packDate, int tagNo) {
	super();
	this.packNo = packNo;
	this.packName = packName;
	this.packContent = packContent;
	this.packDate = packDate;
	this.tagNo = tagNo;
}

@Override
public String toString() {
	return "Pack [packNo=" + packNo + ", packName=" + packName + ", packContent=" + packContent + ", packDate="
			+ packDate + ", tagNo=" + tagNo + "]";
}

public int getPackNo() {
	return packNo;
}

public void setPackNo(int packNo) {
	this.packNo = packNo;
}

public String getPackName() {
	return packName;
}

public void setPackName(String packName) {
	this.packName = packName;
}

public String getPackContent() {
	return packContent;
}

public void setPackContent(String packContent) {
	this.packContent = packContent;
}

public Date getPackDate() {
	return packDate;
}

public void setPackDate(Date packDate) {
	this.packDate = packDate;
}

public int getTagNo() {
	return tagNo;
}

public void setTagNo(int tagNo) {
	this.tagNo = tagNo;
}






}
