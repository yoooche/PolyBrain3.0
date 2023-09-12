package feature.cart.controller;

import core.coreVO.Core;
import core.util.CommonUtil;
import feature.cart.service.CartTraceService;
import feature.cart.vo.CartTraceVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static core.util.CommonUtil.json2Pojo;

@WebServlet("/CartInsert")
public class CartInsertServlet extends HttpServlet {
    CommonUtil commonUtil = new CommonUtil();
    CartTraceService cartTraceService = new CartTraceService();
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        final CartTraceVO cartTraceVO = json2Pojo(req, CartTraceVO.class);

        final Core core = new Core();
        if (cartTraceVO == null) {
            core.setMessage("不對喔，老闆~~");
            core.setSuccess(false);
        } else {
            core.setSuccess(cartTraceService.addToCart(cartTraceVO));
        }
        commonUtil.writePojo2Json(res, core);
    }
}
