package feature.cart.controller;


import feature.cart.service.CartTraceService;
import feature.cart.vo.CartTraceVO;
import feature.item.dao.impl.ItemDAOimplPeter;
import feature.item.vo.itemVOPeter;
import feature.mail.service.MailService;
import feature.mem.dao.MemDaoImpl;
import feature.mem.vo.MemVo;
import feature.order.service.OrderService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/view/CartTrace/ConfirmOrder")//這要確認一下
public class CartTraceServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        List<CartTraceVO> cartTraceVOList = new ArrayList<CartTraceVO>();
        List<itemVOPeter> itemVOList = new ArrayList<itemVOPeter>();
        List<itemVOPeter> itemVOnewList = new ArrayList<>();

        if ("getAll".equals(action)) {

            MemVo memVo = (MemVo) session.getAttribute("memVo"); //要有人set
            Integer memNo = 1001; //memVo.getMemNo();
//            Integer memId = Integer.valueOf(req.getParameter("memId"));

            CartTraceService cartTraceService = new CartTraceService();
            cartTraceVOList = cartTraceService.getAllCartItem(memNo); //用會員編號查商品編號 會員編號 數量的資訊

            if (cartTraceVOList.size() == 0) {
                RequestDispatcher failureView = req.getRequestDispatcher(""); //這要記得改改改
                failureView.forward(req, res);
                return;
            }
            session.setAttribute("cartTraceVOList", cartTraceVOList);

            ItemDAOimplPeter itemDAOimpl = new ItemDAOimplPeter(); //這要改成service層
            itemVOList = itemDAOimpl.selectAll();

            int orderTotal = 0;

            for (CartTraceVO cartTraceList : cartTraceVOList) { //商品編號 會員編號 數量
                itemVOList = itemDAOimpl.selectAll1(cartTraceList.getItemNo()); //從迴圈拿到商品編號 套到selectAll1(Integer itemNo)的方法內

                for (itemVOPeter itemVOs : itemVOList) {
                    orderTotal += cartTraceList.getQuantity() * itemVOs.getItemPrice();
                    itemVOnewList.add(itemVOs);
                }
            }

            session.setAttribute("itemVOnewList", itemVOnewList);
            session.setAttribute("orderTotal", orderTotal);
            String url = "/view/CartTrace/CartTrace.jsp";
            RequestDispatcher View = req.getRequestDispatcher(url);
            View.forward(req, res);

        }


        if ("orderConfirm".matches(action)) {
//            LocalDateTime currentDateTime = LocalDateTime.now();
//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//            String tranTime = currentDateTime.format(formatter);
            HashMap<String, String> errorMsgs = new HashMap<String, String>();

            String receiverName = req.getParameter("receiverName");
            if (receiverName == null || receiverName.trim().isEmpty()) {
                errorMsgs.put("receiverName", "請填寫收件人姓名");
            }

            String receiverAddress = req.getParameter("receiverAddress");
            if (receiverAddress == null || receiverAddress.trim().isEmpty()) {
                errorMsgs.put("receiverAddress", "請填寫收件地址");
            }    //要記得地址欄不得為空 jsp input 最好還是有值

            String receiverPhone = req.getParameter("receiverPhone");
            String rPhoneReg = "^09[0-9]{8}$";
            if (receiverPhone == null || receiverPhone.trim().isEmpty()) {
                errorMsgs.put("receiverPhone", "收件人電話不為空");
            } else if (!receiverPhone.trim().matches(rPhoneReg)) {
                errorMsgs.put("receiverPhone", "手機號碼格式不正確");
            }

            String receiverMethodTemp = req.getParameter("receiverMethod");
            if (receiverMethodTemp == null || receiverMethodTemp.matches("default")) {
                errorMsgs.put("receiverMethod", "你沒有選擇寄送方式喔! ");
            }
            Integer receiverMethod = null;
            switch (receiverMethodTemp) {
                case "mail":
                    receiverMethod = 0;
                    break;
                case "storePickup":
                    receiverMethod = 1;
                    break;
            }

            //之後改成錢包餘額 > 總金額才可以結帳 若小於就無法跳至下一頁(成功畫面) return
            if(true){
                errorMsgs.put("noConfirmOrder", "付款失敗");
                System.out.println("未完成付款(true)");
            }

            if (!errorMsgs.isEmpty()) {
                req.setAttribute("errorMsgs", errorMsgs);
                String url = "/view/CartTrace/CartTrace.jsp";
                RequestDispatcher failureView = req.getRequestDispatcher(url);
                failureView.forward(req, res);
                return;
            }




            Integer memNo = 1001;//(Integer)session.getAttribute("memNo"); //memVo.getMemNo();
            Integer orderTotal = (Integer) session.getAttribute("orderTotal");
            Integer orderState = 0;
            OrderService orderService = new OrderService();
            Integer orderNo = orderService.addOrder(memNo, orderTotal, orderState, receiverName, receiverAddress,
                    receiverPhone, receiverMethod);   //訂單編號

            //前端 History把session清起來




            MemDaoImpl memDaoimpl = new MemDaoImpl(); //改成service
            MemVo all = memDaoimpl.selectById(memNo);

            String memName = all.getMemName(); //會員姓名
            String memEmail = all.getMemEmail(); //會員email
            String memInfo = "訂單資訊";
            String mailText = "親愛的貴賓:"+ memName + "\n" +
                              "感謝您在PolyBrain桌桌訂購，以下是訂單資訊\n"+
                              "訂單總金額: "+orderTotal+"\n"+
                              "結帳狀態: " + "已付款"+"\n"+
                              "訂單號碼" + orderNo;
            new MailService().sendMail(memEmail,memInfo,mailText);

            String url = "/view/order/select.jsp"; //到下一頁

            RequestDispatcher View = req.getRequestDispatcher(url);
            View.forward(req, res);

        }

    }
}
