package feature.order.vo;

import lombok.Data;

import javax.persistence.*;
import java.sql.Date;

@Data
@Entity
@Table(name = "item_order")
public class ItemOrderVO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //若資料庫 PK欄位名稱與VO名稱不一致,仍須@Column
    @Column(name="ORDER_NO")
    private Integer orderNo;
    @Column(name="MEM_NO")
    private Integer memNo;
    //資料庫有預設資料, insertable就要是false(跳過此欄位)
    @Column(name="TRAN_TIME", insertable = false ,updatable = false)
    private Date tranTime;
    @Column(name="ORDER_TOTAL", insertable = false)
    private Integer orderTotal;
    @Column(name="ORDER_STATE", insertable = false)
    private Integer orderState;
    @Column(name="RECEIVER_NAME")
    private String receiverName;
    @Column(name="RECEIVER_ADDRESS")
    private String receiverAddress;
    @Column(name="RECEIVER_PHONE")
    private String receiverPhone;
    @Column(name="RECEIVER_METHOD")
    private Integer receiverMethod;
}
