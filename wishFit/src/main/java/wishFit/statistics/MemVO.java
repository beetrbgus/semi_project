package wishFit.statistics;

public class MemVO {
	private String member;
	private int total;
	
	public MemVO() {
		super();
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "GenderVO [member=" + "member" + ", total=" + total + "]";
	}		
	}
