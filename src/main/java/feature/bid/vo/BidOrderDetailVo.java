package feature.bid.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Table(name="bid_Order_Detail")
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class BidOrderDetailVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bod_no")
    private Integer bodNo;

    @Column(name = "bid_order_no")
    private Integer bidOrderNo;

    @Column(name = "receiver_Name")
    private String receiverName;

    @Column(name = "receiver_address")
    private String receiverAddress;

    @Column(name = "receiver_phone")
    private String receiverPhone;

    @Column(name = "receiver_method")
    private Integer receiverMethod;
}
