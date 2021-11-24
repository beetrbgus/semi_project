package wishFit.statistics;

public class BoardLeplyVO {
	private String replyNo;
	private int total;
	
	public String getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public BoardLeplyVO() {
		super();
	}
	@Override
	public String toString() {
		return "GradeVO [replyNo=" + replyNo + ", total=" + total + "]";
	}
}
