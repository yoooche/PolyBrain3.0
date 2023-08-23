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
@Table(name = "booking")
public class BookingVo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BOOKING_NO",insertable = false )
    private Integer bookingno;
    @Column(name = "MEM_NO" )
    private Integer memno;
    @Column(name = "BOOKING_STATE")
    private  Integer bookingstate;
    @Column(name = "BOOKING_DATE", insertable = false)
    private Date bookingdate;

}
