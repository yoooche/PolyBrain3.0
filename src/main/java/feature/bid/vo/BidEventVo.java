package feature.bid.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "BID_EVENT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BidEventVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private BidEventId bidEventId;

    @Column(name = "FLOOR_PRICE")
    private Integer floorPrice;

    @Column(name = "LEAST_OFFERS")
    private Integer leastOffers;

    @Column(name = "START_TIME")
    private Date startTime;

    @Column(name = "CLOSE_TIME")
    private Date closeTime;

    @Column(name = "DIRECTIVE_PRICE")
    private Integer directivePrice;

    @OneToOne
    @JoinColumn(name = "BID_ITEM_NO", referencedColumnName = "BID_ITEM_NO")
    private BidItemVo bidItemVo;

}
