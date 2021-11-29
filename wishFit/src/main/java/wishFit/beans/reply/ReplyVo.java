package wishFit.beans.reply;

public class ReplyVo {
	private int replyNo;
	private String memNick;
	private String replyDate;
	private String replyPost;
	private String replyId;
	private String mpUpload;
	private int boardNo;
	private int mpNo;
	
	
	public int getMpNo() {
		return mpNo;
	}
	public void setMpNo(int mpNo) {
		this.mpNo = mpNo;
	}
	public ReplyVo() {
		super();
		
	}
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
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getMpUpload() {
		return mpUpload;
	}
	public void setMpUpload(String mpUpload) {
		this.mpUpload = mpUpload;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
}
