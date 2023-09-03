package feature.item.controller;


import core.util.CommonUtil;
import feature.item.service.ItemService;
import feature.item.service.ItemServiceImpl;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/selectAllServlet")
public class ItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemService service = new ItemServiceImpl();
    CommonUtil commonUtil = new CommonUtil();

    //    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request,response);
//    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
            commonUtil.writePojo2Json(response, service.getAllItems());
        }
    }
