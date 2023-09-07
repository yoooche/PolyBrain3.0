package feature.bid.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "BID_ITEM_PIC")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BidItemPicVo implements Serializable { // 先暫時不用，先存單張圖片
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "BID_ITEM_PIC_NO", insertable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bidItemPicNo;

    @Column(name = "BID_ITEM_PIC")
    private byte[] bidItemPic;

    @Column(name = "BID_ITEM_NO")
    private Integer bidItemNo;
}
