package com.colo.persist;

import java.util.List;

import com.colo.domain.UserOrderListVO;

public interface UserOrderListDAORule {

	public int insert(UserOrderListVO ovo);

	public List<UserOrderListVO> orderList(int mno);
}
