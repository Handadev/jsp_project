package com.colo.persist;

import java.util.List;

import com.colo.domain.CouponVO;
import com.colo.domain.UserCouponVO;

public interface UserCouponDAORule {
	public int insert(UserCouponVO ucvo);
	public int delete(int cpno);
	public List<UserCouponVO> couponList(int mno);
	public List<CouponVO> myCouponList(int mno);
}
