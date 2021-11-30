package wishFit.beans.member;

public class FriendDto {
	private int friendNo;
	private String friendId, friendNick;
	private String friendDate;
	public FriendDto() {
		super();

	}
	@Override
	public String toString() {
		return "FriendDto [friendNo=" + friendNo + ", friendId=" + friendId + ", friendNick=" + friendNick
				+ ", friendDate=" + friendDate + "]";
	}
	public int getFriendNo() {
		return friendNo;
	}
	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}
	public String getFriendId() {
		return friendId;
	}
	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}
	public String getFriendNick() {
		return friendNick;
	}
	public void setFriendNick(String friendNick) {
		this.friendNick = friendNick;
	}
	public String getFriendDate() {
		return friendDate;
	}
	public void setFriendDate(String friendDate) {
		this.friendDate = friendDate;
	}
}
