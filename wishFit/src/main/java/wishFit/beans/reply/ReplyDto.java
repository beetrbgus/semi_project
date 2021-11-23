package wishFit.beans.reply;

// 댓글 테이블에 있는 정보 
public class ReplyDto {
	private int replyNo,boardNo;
	private String replyId,replyPost,replyDate;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getReplyPost() {
		return replyPost;
	}
	public void setReplyPost(String replyPost) {
		this.replyPost = replyPost;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public ReplyDto() {
		super();
	}
	

}
