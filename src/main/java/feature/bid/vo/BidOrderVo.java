package feature.bid.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serial;
import java.io.Serializable;
@Entity(name = "BID_ORDER")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BidOrderVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "BID_ORDER_NO")
    private int bidOrderNo;

    @Column(name = "BID_EVENT_NO")
    private int bidEventNo;

    @Column(name = "BID_ITEM_NO")
    private String bidItemNo;

    @Column(name = "FINAL_PRICE")
    private Integer finalPrice;

    @Column(name = "MEM_NO")
    private Integer memNo;

}
