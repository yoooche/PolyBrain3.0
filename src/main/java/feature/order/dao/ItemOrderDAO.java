package feature.order.dao;

import core.coreDao.CoreDao;
import feature.order.vo.ItemOrderVO;

import java.util.List;

public interface ItemOrderDAO extends CoreDao<ItemOrderVO, Integer>{


    ItemOrderVO selectByOrderNumber(Integer orderNo);

    List<ItemOrderVO> selectByMemberNumber(Integer memNo);

    ItemOrderVO updateAnOrder(ItemOrderVO itemordervo);

}
