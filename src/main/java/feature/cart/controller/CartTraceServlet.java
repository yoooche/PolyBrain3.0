package feature.cart.controller;


import feature.cart.service.CartTraceService;
import feature.cart.vo.CartTraceVO;
import feature.item.dao.impl.ItemDAOimplPeter;
import feature.item.vo.itemVOPeter;
import feature.mail.service.MailService;
import feature.mem.dao.MemDaoImpl;
import feature.mem.vo.MemVo;
import feature.order.service.OrderService;
import feature.order.vo.ItemOrderDetailVO;

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
        System.out.println("ABCDEFG"); //這邊在做一個判斷式
        String action = req.getParameter("action");
        if ("getAll".equals(action)) {
            List<CartTraceVO> cartTraceVOList = new ArrayList<CartTraceVO>();
            List<itemVOPeter> itemVOList = new ArrayList<itemVOPeter>();
            List<itemVOPeter> itemVONewList = new ArrayList<itemVOPeter>();

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

            int orderTotal = 0;

            for (int i = 0; i < cartTraceVOList.size(); i++) { //會員編號 商品編號 數量
                if (cartTraceVOList.get(i).getQuantity() != 0) { //如果數量不是 0， 才能進來判斷
                    itemVOList = itemDAOimpl.selectAll1(cartTraceVOList.get(i).getItemNo());  //從迴圈拿到商品編號 套到selectAll1(Integer itemNo)的方法內
                    for (itemVOPeter itemVOs : itemVOList) {
                        orderTotal += cartTraceVOList.get(i).getQuantity() * itemVOs.getItemPrice();
                        itemVONewList.add(itemVOs);
                    }
                } else {
                    itemDAOimpl.deleteByItemNo(memNo, cartTraceVOList.get(i).getItemNo());
                    cartTraceVOList.remove(i);
                }

            }

            session.setAttribute("itemVONewList", itemVONewList);

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
            if (false) {
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

            List<CartTraceVO> cartTraceVOList = (List<CartTraceVO>) session.getAttribute("cartTraceVOList");
            List<itemVOPeter> itemVONewList = (List<itemVOPeter>) session.getAttribute("itemVONewList");

            System.out.println(cartTraceVOList.size());
            //前端 History把session清起來
            for (int i = 0; i < itemVONewList.size(); i++) {
                ItemOrderDetailVO itemOrderDetailVO =
                        new ItemOrderDetailVO(orderNo,
                                cartTraceVOList.get(i).getItemNo(),
                                cartTraceVOList.get(i).getQuantity(),
                                itemVONewList.get(i).getItemPrice());
                System.out.println(cartTraceVOList.get(i).getItemNo());
                System.out.println(cartTraceVOList.get(i).getQuantity());
                System.out.println(itemVONewList.get(i).getItemPrice());
                orderService.addAnOrderDetail(itemOrderDetailVO);
            }

            MemDaoImpl memDaoimpl = new MemDaoImpl(); //改成service
            MemVo memVo = memDaoimpl.selectById(memNo);

            String memName = memVo.getMemName(); //會員姓名
            String memEmail = memVo.getMemEmail(); //會員email
            String memInfo = "PolyBrain訂單資訊";

            String mailText =
                    "<!DOCTYPE html>" +
                            "<html lang=\"zh-Hant\">" +
                            "<head>" +
                            "    <meta charset=\"UTF-8\">" +
                            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                            "</head>" +
                            "<body style=\"color: #F0F8FF; text-align: center;\">" +
                            "    <div style=\"background-color: #212121; border-radius: 5px; color: #F0F8FF;\">" +
                            "        <dir style=\"text-align: center;\">" +
                            "            <img class=\"mt-3 \" src=\"cid:1 \" height=\"50%\" width=\"50%\">" +
                            "        </dir>" +
                            "        <h2 style=\"text-align: center;\"><strong>PolyBrain 桌桌</strong> 感謝你的訂單</h2><br>" +
                            "        <div style=\"display: inline-block; text-align: left; color: #F0F8FF;\">" +
                            "            <p style=\"font-size: 1.1rem; color: #F0F8FF;\">訂單狀態為: <span style=\"font-weight: bold;\">處理中</span> <br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">付款狀態為: <span style=\"font-weight: bold;\">已付款 </span><br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">送貨狀態為:<span style=\"font-weight: bold;\"> 備貨中 </span> <br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">有關訂單的查詢或要聯絡 <span style=\"font-weight: bold;\">PolyBrain</span><br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">請登入以下連結。<br></p>" +
                            "            <button style=\"background-color: #d2b48c; border-radius:5px; width: 85%; height: 40px;\">" +
                            "                <a href=\"http://localhost:8080/PolyBrain\"" +
                            "                    style=\"text-decoration: none;color: #000000;font-size: 1.1rem;\">訂單連結</a></button><br>" +
                            "            <p style=\"font-size: 1.1rem; color: #F0F8FF;\">親愛的貴賓:<strong> "+memName.toString()+"</strong> <br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">感謝您在<strong>PolyBrain桌桌訂購</strong><br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">以下是訂單資訊 <br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">訂單號碼: <strong>"+orderNo.toString()+"</strong><br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">結帳狀態: <strong>已付款 </strong><br></p>" +
                            "            <p style=\"font-size: 1.1rem;color: #F0F8FF;\">訂單總金額:<strong> "+ orderTotal.toString() +" </strong><br></p>" +
                            "        </div>" +
                            "    </div>" +
                            "</body>" +
                            "</html>";

            new MailService().sendMail(memEmail, memInfo, mailText);


            String url = "/view/order/listAllOrder.jsp"; //到下一頁

            RequestDispatcher View = req.getRequestDispatcher(url);
            View.forward(req, res);

        }

    }
}
