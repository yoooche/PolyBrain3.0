package feature.order.service;

import feature.order.dao.ItemOrderDAO;
import feature.order.dao.impl.ItemOrderDAOimpl;
import feature.order.vo.ItemOrderVO;

import java.util.List;

public class OrderService {

    private ItemOrderDAO dao;

    public OrderService(){
        dao = new ItemOrderDAOimpl();
    }
    public Integer addOrder (Integer memNo,  Integer orderTotal, Integer orderState, String receiverName, String receiverAddress, String receiverPhone, Integer receiverMethod){
        ItemOrderVO itemOrderVO = new ItemOrderVO();
        itemOrderVO.setMemNo(memNo);
        itemOrderVO.setOrderTotal(orderTotal);
        itemOrderVO.setOrderState(orderState);
        itemOrderVO.setReceiverName(receiverName);
        itemOrderVO.setReceiverAddress(receiverAddress);
        itemOrderVO.setReceiverPhone(receiverPhone);
        itemOrderVO.setReceiverMethod(receiverMethod);

        return dao.insert(itemOrderVO);
    }

    public ItemOrderVO getOneOrder(Integer orderNo){
        return dao.selectById(orderNo);
    }

    public List<ItemOrderVO> getAll(){
        System.out.println("aaa");
        return dao.selectAll();
    }
    public ItemOrderVO updateBackOrder(ItemOrderVO itemordervo){

//        OrderService odsvc = new OrderService();
//        System.out.println(itemordervo.getOrderNo());
//        ItemOrderVO itemordervoDB =dao.selectById(itemordervo.getOrderNo());
//        ItemOrderVO itemordervoDB = odsvc.getOneOrder(orderNo);
//        itemordervo.setOrderNo(itemordervo.getOrderNo());
//        itemordervo.setMemNo(itemordervo.getMemNo());
//        itemordervo.setReceiverAddress(itemordervo.getReceiverAddress());
//        itemordervo.setReceiverName(itemordervo.getReceiverName());
//        itemordervo.setReceiverPhone(itemordervo.getReceiverPhone());
//
//        itemordervo.setOrderTotal(itemordervoDB.getOrderTotal());
//        itemordervo.setReceiverMethod(itemordervoDB.getReceiverMethod());
//        itemordervo.setOrderState(itemordervoDB.getOrderState());
//        itemordervo.setTranTime(itemordervoDB.getTranTime());
//        System.out.println("jdbcgood");
        return dao.updateAnOrder(itemordervo);
    }

    public boolean deleteById(Integer orderNo){
            return dao.deleteById(orderNo) > 0;
    }


}
