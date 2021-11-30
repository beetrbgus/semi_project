package wishFit.beans.mysmallgroup;

public class MySmallGroupDto {
private int fgJoinNo, fgNo;
private String memId;
@Override
public String toString() {
	return "MySamllGroupDto [fgJoinNo=" + fgJoinNo + ", fgNo=" + fgNo + ", memId=" + memId + "]";
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
public String getMemId() {
	return memId;
}
public void setMemId(String memId) {
	this.memId = memId;
}
}
