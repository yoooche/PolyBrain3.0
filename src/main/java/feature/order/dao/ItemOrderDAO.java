package feature.order.dao;

import core.coreDao.CoreDao;
import feature.order.vo.ItemOrderVO;

public interface ItemOrderDAO extends CoreDao<ItemOrderVO, Integer>{


    ItemOrderVO selectByOrderNumber(Integer orderNo);

    ItemOrderVO selectByMemberNumber(Integer memberNo);

    ItemOrderVO updateAnOrder(ItemOrderVO itemordervo);
}
