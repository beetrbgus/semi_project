package wishFit.beans.member;

import java.sql.Date;

public class MemberDto {
	String memId,memPw,memNick,memGrade,memBirth,memGender,memPwQ,memPwA,memName,memPhone;
	int memReport;
	Date memJoin;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemGrade() {
		return memGrade;
	}
	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemPwQ() {
		return memPwQ;
	}
	public void setMemPwQ(String memPwQ) {
		this.memPwQ = memPwQ;
	}
	public String getMemPwA() {
		return memPwA;
	}
	public void setMemPwA(String memPwA) {
		this.memPwA = memPwA;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public int getMemReport() {
		return memReport;
	}
	public void setMemReport(int memReport) {
		this.memReport = memReport;
	}
	public Date getMemJoin() {
		return memJoin;
	}
	public void setMemJoin(Date memJoin) {
		this.memJoin = memJoin;
	}
	public MemberDto() {
		super();
	}
	
	
	
	
}
