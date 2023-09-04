package feature.cart.service;

import feature.cart.dao.CartTraceDAO;
import feature.cart.dao.impl.CartTraceDAOimpl;
import feature.cart.vo.CartTraceVO;

import java.util.List;

public class CartTraceService {
    private CartTraceDAO dao;

    public CartTraceService(){
        dao = new CartTraceDAOimpl();
    }
    public List<CartTraceVO> getAllCartItem(Integer memNo){
        return dao.selectAll(memNo);
    }
}
