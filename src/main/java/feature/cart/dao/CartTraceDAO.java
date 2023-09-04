package feature.cart.dao;

import core.coreDao.CoreDao;
import feature.cart.vo.CartTraceVO;

import java.util.List;

public interface CartTraceDAO extends CoreDao<CartTraceVO, Integer> {
    CartTraceVO selectByMemberNumber(Integer memNo);

    List<CartTraceVO> selectAll(Integer memNo);

}
