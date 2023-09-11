package feature.cart.vo;

import feature.item.vo.Item;
import feature.mem.vo.MemVo;
import lombok.Data;

import javax.persistence.*;

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
