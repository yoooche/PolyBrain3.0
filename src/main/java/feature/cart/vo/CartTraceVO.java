package feature.cart.vo;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name="item_trace")
public class CartTraceVO {
    @Id
    @Column(name="MEM_NO" ,insertable = false,updatable = false)
    private Integer memNo;
    @Column(name="ITEM_NO", insertable = false, updatable = false)
    private Integer itemNo;
    @Column(name="quantity")
    private Integer quantity;
}
