package wishFit.beans.fitgroupimage;

public class FitgroupImageDto {
private int fgImageNo , fgNo;
private long fgImageSize;
private String fgImageUpload, fgImageSave, fgImageType;
public int getFgImageNo() {
	return fgImageNo;
}
public void setFgImageNo(int fgImageNo) {
	this.fgImageNo = fgImageNo;
}
public int getFgNo() {
	return fgNo;
}
public void setFgNo(int fgNo) {
	this.fgNo = fgNo;
}
public long getFgImageSize() {
	return fgImageSize;
}
public void setFgImageSize(long fgImageSize) {
	this.fgImageSize = fgImageSize;
}
public String getFgImageUpload() {
	return fgImageUpload;
}
public void setFgImageUpload(String fgImageUpload) {
	this.fgImageUpload = fgImageUpload;
}
public String getFgImageSave() {
	return fgImageSave;
}
public void setFgImageSave(String fgImageSave) {
	this.fgImageSave = fgImageSave;
}
public String getFgImageType() {
	return fgImageType;
}
public void setFgImageType(String fgImageType) {
	this.fgImageType = fgImageType;
}
@Override
public String toString() {
	return "FitgroupImageDto [fgImageNo=" + fgImageNo + ", fgNo=" + fgNo + ", fgImageSize=" + fgImageSize
			+ ", fgImageUpload=" + fgImageUpload + ", fgImageSave=" + fgImageSave + ", fgImageType=" + fgImageType
			+ "]";
}

}
