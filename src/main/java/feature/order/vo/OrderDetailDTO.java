package feature.order.vo;

import lombok.Data;

@Data
public class OrderDetailDTO {
    Integer itemSales;
    Integer itemPrice;
    String itemName;
    String itemImg;
    ItemOrderVO itemOrderVO;
}
