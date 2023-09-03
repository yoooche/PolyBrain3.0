package feature.booking.vo;

import lombok.*;

import javax.persistence.*;
import java.io.Serial;
import java.io.Serializable;
import java.sql.Date;
@Entity
@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "bookinglist")
public class BookingVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BOOKING_NO",insertable = false )
    private Integer bookingno;
    @Column(name = "TABLE_NO")
    private Integer tableno;
    @Column(name = "TABLE_DATE")
    private  Date tabledate;
    @Column(name = "BOOKING_CHECK_STATE")
    private Integer bookingcheckstate;
    @Column(name = "BOOKING_STATE")
    private Integer bookingstate;
    @Column(name = "PERIOD_TIME")
    private Integer periodtime;
    @Column(name = "MEM_NO" )
    private Integer memno;

}
