package wishFit.beans.reply;

// 댓글 목록에 보여지는 정보들에 대한 VO
public class ReplyVo {
	private int replyNo;
	private String memNick;
	private String replyDate;
	private String replyPost;
	private int mpUpload;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyPost() {
		return replyPost;
	}
	public void setReplyPost(String replyPost) {
		this.replyPost = replyPost;
	}
	public int getMpUpload() {
		return mpUpload;
	}
	public void setMpUpload(int mpUpload) {
		this.mpUpload = mpUpload;
	}
	public ReplyVo() {
		
	}
	
	
}
