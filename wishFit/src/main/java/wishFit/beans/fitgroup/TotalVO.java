package wishFit.beans.fitgroup;

public class TotalVO {
private String fgName;
private int total;
public String getFgName() {
	return fgName;
}
public void setFgName(String fgName) {
	this.fgName = fgName;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
@Override
public String toString() {
	return "Total [fgName=" + fgName + ", total=" + total + "]";
}

}
