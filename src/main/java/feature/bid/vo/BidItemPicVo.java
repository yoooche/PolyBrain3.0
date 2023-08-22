package feature.bid.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serial;
import java.io.Serializable;
@Entity(name = "BID_ITEM_PIC")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BidItemPicVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "BID_ITEM_PIC_NO")
    private int bidItemPicNo;

    @Column(name = "BID_ITEM_PIC")
    private byte[] bidItemPic;

    @Column(name = "BID_ITEM_NO")
    private String bidItemNo;
}
