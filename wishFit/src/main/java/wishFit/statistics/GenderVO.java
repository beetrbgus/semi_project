package wishFit.statistics;

public class GenderVO {
	private String memGender;
	private int total;
	
	public GenderVO() {
		super();
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "GenderVO [memGender=" + memGender + ", total=" + total + "]";
	}
	}
