package wishFit.statistics;

public class GradeVO {
	private String memGrade;
	private int total;
	
	public String getMemGrade() {
		return memGrade;
	}
	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public GradeVO() {
		super();
	}
	@Override
	public String toString() {
		return "GradeVO [memGrade=" + memGrade + ", total=" + total + "]";
	}

}