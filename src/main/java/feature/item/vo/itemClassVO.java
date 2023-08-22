package feature.item.vo;

public class itemClassVO {
	private int itemClassNo;
	private String itemClassName;

	public itemClassVO(int itemClassNo, String itemClassName) {
		this.itemClassNo = itemClassNo;
		this.itemClassName = itemClassName;
	}

	public int getItemClassNo() {
		return itemClassNo;
	}

	public void setItemClassNo(int itemClassNo) {
		this.itemClassNo = itemClassNo;
	}

	public String getItemClassName() {
		return itemClassName;
	}

	public void setItemClassName(String itemClassName) {
		this.itemClassName = itemClassName;
	}

}
