package wishFit.beans.message;

public class MessageVo {
	private int msg_no;
	
	private String msg_receiver;
	private String msg_sender;
	private String mem_nick ; 
	private int profile_no;
	
	private String msg_sendTime;
	private String msg_readTime;
	
	private int msgCon_no;
	private String msgCon_title;
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
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(String msg_receive) {
		this.msg_receiver = msg_receive;
	}
	public int getMsgCon_no() {
		return msgCon_no;
	}
	public void setMsgCon_no(int msgCon_no) {
		this.msgCon_no = msgCon_no;
	}
	public String getMsgCon_title() {
		return msgCon_title;
	}
	public void setMsgCon_title(String msgCon_title) {
		this.msgCon_title = msgCon_title;
	}
	public String getMsgCon_text() {
		return msgCon_text;
	}
	public void setMsgCon_text(String msgCon_text) {
		this.msgCon_text = msgCon_text;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public int getProfile_no() {
		return profile_no;
	}
	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}
	
	
	
}
