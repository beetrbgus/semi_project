package wishFit.statistics;

public class FitNameVO {
	private String excateName;
	private int total;
	
	public FitNameVO() {
		super();
	}
	public String getExcateName() {
		return excateName;
	}
	public void setExcateName(String excateName) {
		this.excateName = excateName;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "FitVO [excateName=" + "excateName" + ", total=" + total + "]";
	}		
	}

