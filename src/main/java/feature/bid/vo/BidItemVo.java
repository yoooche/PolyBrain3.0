package feature.bid.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serial;
import java.io.Serializable;
import java.sql.Clob;

@Entity(name = "BID_ITEM")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BidItemVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "BID_ITEM_NO")
    private String bidItemNo;

    @Column(name = "BID_ITEM_NAME")
    private String bidItemName;

    @Column(name = "BID_ITEM_DESCRIBE")
    private String bidItemDescribe;

    @Column(name = "ITEM_CLASS_NO")
    private Integer itemClassNo;

    @Column(name = "GAME_PUBLISHER")
    private String gamePublisher;
}
