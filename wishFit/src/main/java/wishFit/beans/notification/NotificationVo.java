package wishFit.beans.notification;

public class NotificationVo {
	
	private int no;
	private String myId;
	private String sender;
	private String message;
	private String notiTime;
	private String noticategory;
	private String read;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMyId() {
		return myId;
	}
	public void setMyId(String myId) {
		this.myId = myId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNotiTime() {
		return notiTime;
	}
	public void setNotiTime(String notiTime) {
		this.notiTime = notiTime;
	}
	public String getNoticategory() {
		return noticategory;
	}
	public void setNoticategory(String noticategory) {
		this.noticategory = noticategory;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
}
