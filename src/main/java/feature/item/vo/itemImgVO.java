package feature.item.vo;

public class itemImgVO {
	private int itemImgNo;
	private int itemNo;
	private byte[] itemImg;
	private String itemImgName;

	public itemImgVO(int itemImgNo, int itemNo, byte[] itemImg, String itemImgName) {
		this.itemImgNo = itemImgNo;
		this.itemNo = itemNo;
		this.itemImg = itemImg;
		this.itemImgName = itemImgName;
	}

	public int getItemImgNo() {
		return itemImgNo;
	}

	public void setItemImgNo(int itemImgNo) {
		this.itemImgNo = itemImgNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public byte[] getItemImg() {
		return itemImg;
	}

	public void setItemImg(byte[] itemImg) {
		this.itemImg = itemImg;
	}

	public String getItemImgName() {
		return itemImgName;
	}

	public void setItemImgName(String itemImgName) {
		this.itemImgName = itemImgName;
	}
	
	
}
