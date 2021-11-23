package wishFit.beans.member;

public class FRequestDto {
	private String stat;
	private int friendNo;
	public FRequestDto() {
		super();

	}
	@Override
	public String toString() {
		return "FriendRequestDto [stat=" + stat + ", friendNo=" + friendNo + "]";
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public int getFriendNo() {
		return friendNo;
	}
	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}
}
