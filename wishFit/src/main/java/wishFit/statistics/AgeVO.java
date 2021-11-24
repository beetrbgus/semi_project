package wishFit.statistics;

public class AgeVO {
	private String memBirth;
	private int total;
	
	public AgeVO() {
		super();
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "GenderVO [memBirth=" + "memBirth" + ", total=" + total + "]";
	}		
	}