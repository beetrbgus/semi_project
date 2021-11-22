package wishFit.beans.admin;


public class MemoDto {
	private int memoNo;
	private String memId;
	private String memoContent;
	private String memoTime;
	
	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemoContent() {
		return memoContent;
	}
	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}
	public String getMemoTime() {
		return memoTime;
	}
	public void setMemoTime(String memoTime) {
		this.memoTime = memoTime;
	}
	public MemoDto() {
		super();
	}
	@Override
	public String toString() {
		return "MemoDto [memoNo=" + memoNo + ", memId=" + memId + ", memoContent=" + memoContent + ", memoTime="
				+ memoTime + "]";
	}
	
	
	
}
	
	
