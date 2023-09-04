package feature.booking.service;

import feature.booking.dao.BookingDao;
import feature.booking.dao.BookingDaoImpl;
import feature.booking.vo.BookingVo;
import org.hibernate.SessionFactory;

import java.sql.Date;
import java.util.List;

public class BookingServiceImpl implements BookingService {
    private SessionFactory sessionFactory;

    private BookingDao Dao;
    public BookingServiceImpl(){
        Dao = new BookingDaoImpl();
    }
    //用預約狀態以及日期條件查詢
    @Override
    public List<BookingVo> selectdate(int state, Date startDate, Date endDate){
        List<BookingVo> result = Dao.selectByDate(state, startDate, endDate);
        return result;
    }
    @Override
    public List<BookingVo> getAllBooking(){
        List<BookingVo> result = Dao.selectAll();
        return  result;
    }
    //已預約狀態查詢(暫不用)
    @Override
    public List<BookingVo> selectone(Integer state) {
        if(state == 1){
            return  Dao.selectById(1);
        } else if (state == 0) {
            return  Dao.selectById(0);
        }else if (state == 2) {
            return Dao.selectAll();
        }
        return null;
    }

    @Override
    public BookingVo cancelBooking(Integer bookno, Integer newState){
        return Dao.cancel(bookno, newState);
    }
    @Override
    public BookingVo checkBookState(Integer bookno, Integer newState){
        return Dao.checkState(bookno, newState);
    }

    @Override
    public boolean remove(Integer bookingno) {
        return Dao.deletbyId(bookingno) > 0;
    }

    @Override
    public boolean save(BookingVo booking) {
        return Dao.updateById(booking) > 0;
    }
    //新的
    public BookingVo insert (BookingVo bookingVo){
        //beginTransaction();
        if (bookingVo.getTableno() == null){
            bookingVo.setMessage("tableno can't be empty");
            bookingVo.setSuccess(false);
            //rollback();
            System.out.println("wrongTable");
            return bookingVo;
        }
        if (bookingVo.getPeriodtime() == null){
            bookingVo.setMessage("period can't be empty");
            bookingVo.setSuccess(false);
            //rollback();
            System.out.println("wrongPeriod");
            return bookingVo;
        }
        if(bookingVo.getTabledate() == null){
            System.out.println("No date");
            return bookingVo;
        }

        final int result = Dao.insert(bookingVo);
        if (result < 1) {
            bookingVo.setMessage("fail");
            bookingVo.setSuccess(false);
            //
            System.out.println("wrong");
        }
        bookingVo.setMessage("ok");
        bookingVo.setSuccess(true);

        System.out.println("Service:" + bookingVo);
        System.out.println("Service:" + result);
        //commit();
        return bookingVo;
    }
}

