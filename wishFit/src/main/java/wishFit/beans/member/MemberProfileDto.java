package wishFit.beans.member;

public class MemberProfileDto {
	private int mpNo;
	private long mpSize;
	private String mpId, mpUpload, mpSave, mpType;
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
	public String getMpId() {
		return mpId;
	}
	public void setMpId(String mpId) {
		this.mpId = mpId;
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
	public MemberProfileDto() {
		super();
	}
	@Override
	public String toString() {
		return "MemberProfileDto [mpNo=" + mpNo + ", mpSize=" + mpSize + ", mpId=" + mpId + ", mpUpload=" + mpUpload
				+ ", mpSave=" + mpSave + ", mpType=" + mpType + "]";
	}
}
