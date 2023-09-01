package feature.order.vo;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Data
@Table(name="order_detail")
public class ItemOrderDetailVO {
        @Column(name="ORDER_NO" ,insertable = false,updatable = false)
        private Integer orderNo;
        @Column(name="ITEM_NO", insertable = false, updatable = false)
        private Integer itemNo;
        @Column(name="ITEM_SALES")
        private Integer itemSales;
        @Column(name="ITEM_PRICE")
        private Integer itemPrice;
}
