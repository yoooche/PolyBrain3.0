package feature.cart.controller;


import feature.cart.service.CartTraceService;
import feature.cart.vo.CartTraceVO;
import feature.item.dao.impl.ItemDAOimpl;
import feature.item.vo.itemVO;
import feature.mem.vo.MemVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart.tw")
public class CartTraceServlet extends HttpServlet {
    public void doGet (HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        doPost(req, res);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        List<CartTraceVO> cartTraceVOList = new ArrayList<CartTraceVO>();

        if("getAll".equals(action)){

            MemVo memVo = (MemVo) session.getAttribute("memVo"); //要有人set
            Integer memNo = memVo.getMemNo();
//            Integer memId = Integer.valueOf(req.getParameter("memId"));
            CartTraceService cartTraceService = new CartTraceService();
            cartTraceVOList = cartTraceService.getAllCartItem(memNo);
            session.setAttribute("cartTraceVOList",cartTraceVOList);

            ItemDAOimpl iopl = new ItemDAOimpl(); //這要改成service層
            List<itemVO> itemVOList = iopl.selectAll();
            List<itemVO> newList = new ArrayList<>();

            for(CartTraceVO cartTraceList : cartTraceVOList){
                for(itemVO itemVO:itemVOList){
                    if(cartTraceList.getItemNo()==itemVO.getItemNo()){
                        newList.add(itemVO);
                    }
                }
            }
            System.out.println(newList);



        }
    }

    public static void main(String[] args) {
        List<CartTraceVO> cartTraceVOList = new ArrayList<CartTraceVO>();
        CartTraceService cartTraceService = new CartTraceService();
        cartTraceVOList = cartTraceService.getAllCartItem(1001);

        ItemDAOimpl iopl = new ItemDAOimpl(); //這要改成service層
        List<itemVO> itemVOList = iopl.selectAll();
        List<itemVO> newList = new ArrayList<>();

        for(CartTraceVO cartTraceList : cartTraceVOList){
            for(itemVO itemVO:itemVOList){
                if(cartTraceList.getItemNo()==itemVO.getItemNo()){
                    newList.add(itemVO);
                }
            }
        }
    }
}
