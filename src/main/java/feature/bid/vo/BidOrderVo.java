package feature.bid.vo;

import feature.mem.vo.MemVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
@Entity
@Table(name = "BID_ORDER")
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

    @Column(name = "FINAL_PRICE")
    private Integer finalPrice;

    @ManyToOne
    @JoinColumn(name = "MEM_NO")
    private MemVo memVo;

    @OneToOne
    @JoinColumn(name = "BID_ITEM_NAME")
    private BidItemVo bidItemVo;
}
