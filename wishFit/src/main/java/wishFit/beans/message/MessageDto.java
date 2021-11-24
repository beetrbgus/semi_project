package wishFit.beans.message;

public class MessageDto {
	private int msg_no;
	private String msg_sendTime;
	private String msg_readTime;
	private String msg_myId;
	private String msg_otherId;
	private int msgCon_no;
	private String msgCon_text;
	
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_sendTime() {
		return msg_sendTime;
	}
	public void setMsg_sendTime(String msg_sendTime) {
		this.msg_sendTime = msg_sendTime;
	}
	public String getMsg_readTime() {
		return msg_readTime;
	}
	public void setMsg_readTime(String msg_readTime) {
		this.msg_readTime = msg_readTime;
	}
	public String getMsg_myId() {
		return msg_myId;
	}
	public void setMsg_myId(String msg_myId) {
		this.msg_myId = msg_myId;
	}
	public String getMsg_otherId() {
		return msg_otherId;
	}
	public void setMsg_otherId(String msg_otherId) {
		this.msg_otherId = msg_otherId;
	}
	public int getMsgCon_no() {
		return msgCon_no;
	}
	public void setMsgCon_no(int msgCon_no) {
		this.msgCon_no = msgCon_no;
	}
	public String getMsgCon_text() {
		return msgCon_text;
	}
	public void setMsgCon_text(String msgCon_text) {
		this.msgCon_text = msgCon_text;
	}
	
	
	
}
