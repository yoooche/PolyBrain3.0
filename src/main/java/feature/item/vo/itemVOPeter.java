package feature.item.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Table(name="item")
@NoArgsConstructor
@Entity
public class itemVOPeter {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name="item_No")
	private int itemNo;
	@Column(name="item_Class_No")
	private int itemClassNo;
	@Column(name="item_Name")
	private String itemName;
	@Column(name="item_Price")
	private int itemPrice;
	@Column(name="item_State")
	private int itemState;
	@Column(name="item_Qty")
	private int itemQty;
	@Column(name="player")
	private int player;
	@Column(name="gameTime")
	private int gameTime;
	@Column(name="item_Prod_Description")
	private String itemProdDescription;

	public itemVOPeter(int itemNo, int itemClassNo, String itemName, int itemPrice, int itemState, int itemQty, int player, int gameTime, String itemProdDescription) {
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
