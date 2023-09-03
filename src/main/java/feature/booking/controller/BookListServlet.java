package feature.booking.controller;

import feature.booking.vo.BookingVo;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


import static core.util.CommonUtil.writePojo2Json;
import static core.util.Constants.JSON_MIME_TYPE;
import static feature.booking.util.BookConstants.SERVICE;


@WebServlet("/booking/list")
public class BookListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        response.setContentType(JSON_MIME_TYPE);
        List<BookingVo> booklist = SERVICE.getAllBooking();
        writePojo2Json(response,booklist);
    }
}
