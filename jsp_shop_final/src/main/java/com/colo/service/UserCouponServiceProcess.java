package com.colo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CouponVO;
import com.colo.persist.UserCouponDAO;

public class UserCouponServiceProcess implements UserCouponService {
	private static Logger logger = LoggerFactory.getLogger(UserCouponServiceProcess.class);
	UserCouponDAO ucdao;
	
	public UserCouponServiceProcess() {
		ucdao = new UserCouponDAO();
	}

	@Override
	public List<CouponVO> myCouponList(int mno) {
		return ucdao.myCouponList(mno);
	}

	@Override
	public boolean couponRemove(int cpno) {
		return ucdao.delete(cpno) > 0 ? true : false;
	}
}
