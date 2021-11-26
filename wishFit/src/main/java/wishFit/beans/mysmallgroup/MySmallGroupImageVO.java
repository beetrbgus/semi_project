package wishFit.beans.mysmallgroup;

public class MySmallGroupImageVO {
//회원+회원프로필+참가자 조인
String memNick,memId,mpUpload,mpSave,mpType;
int fgJoinNo,fgNo,mpNo;
public String getMemNick() {
	return memNick;
}
public void setMemNick(String memNick) {
	this.memNick = memNick;
}
public String getMemId() {
	return memId;
}
public void setMemId(String memId) {
	this.memId = memId;
}
public String getMpUpload() {
	return mpUpload;
}
public void setMpUpload(String mpUpload) {
	this.mpUpload = mpUpload;
}
public String getMpSave() {
	return mpSave;
}
public void setMpSave(String mpSave) {
	this.mpSave = mpSave;
}
public String getMpType() {
	return mpType;
}
public void setMpType(String mpType) {
	this.mpType = mpType;
}
public int getFgJoinNo() {
	return fgJoinNo;
}
public void setFgJoinNo(int fgJoinNo) {
	this.fgJoinNo = fgJoinNo;
}
public int getFgNo() {
	return fgNo;
}
public void setFgNo(int fgNo) {
	this.fgNo = fgNo;
}
public int getMpNo() {
	return mpNo;
}
public void setMpNo(int mpNo) {
	this.mpNo = mpNo;
}
public long getMpSize() {
	return mpSize;
}
public void setMpSize(long mpSize) {
	this.mpSize = mpSize;
}
private long mpSize;
}
