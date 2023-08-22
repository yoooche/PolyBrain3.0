package feature.item.vo;

public class itemVO {

	private int itemNo;
	private int itemClassNo;
	private String itemName;
	private int itemPrice;
	private int itemState;
	private int itemQty;
	private int player;
	private int gameTime;
	private String itemProdDescription;

	public itemVO(int itemNo, int itemClassNo, String itemName, int itemPrice, int itemState, int itemQty, int player, int gameTime, String itemProdDescription) {
        this.itemNo = itemNo;
        this.itemClassNo = itemClassNo;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.itemState = itemState;
        this.itemQty = itemQty;
        this.player = player;
        this.gameTime = gameTime;
        this.itemProdDescription = itemProdDescription;
    }

	
    // Getters and Setters
	
	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getItemClassNo() {
		return itemClassNo;
	}

	public void setItemClassNo(int itemClassNo) {
		this.itemClassNo = itemClassNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemState() {
		return itemState;
	}

	public void setItemState(int itemState) {
		this.itemState = itemState;
	}

	public int getItemQty() {
		return itemQty;
	}

	public void setItemQty(int itemQty) {
		this.itemQty = itemQty;
	}

	public int getPlayer() {
		return player;
	}

	public void setPlayer(int player) {
		this.player = player;
	}

	public int getGameTime() {
		return gameTime;
	}

	public void setGameTime(int gameTime) {
		this.gameTime = gameTime;
	}

	public String getItemProdDescription() {
		return itemProdDescription;
	}

	public void setItemProdDescription(String itemProdDescription) {
		this.itemProdDescription = itemProdDescription;
	}


}
