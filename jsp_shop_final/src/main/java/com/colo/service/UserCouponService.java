package com.colo.service;

import java.util.List;

import com.colo.domain.CouponVO;

public interface UserCouponService {
	public List<CouponVO> myCouponList(int mno);
	public boolean couponRemove(int cpno);
}
