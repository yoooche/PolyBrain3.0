package feature.bid.vo;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class BidEventId implements Serializable {
    @Column(name = "BID_EVENT_NO")
    private Integer bidEventNo;
    @Column(name = "BID_ITEM_NO")
    private String bidItemNo;
}
