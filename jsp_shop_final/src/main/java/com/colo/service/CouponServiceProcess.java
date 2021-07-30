package com.colo.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CouponVO;
import com.colo.domain.UserCouponVO;
import com.colo.persist.CouponDAO;
import com.colo.persist.UserCouponDAO;
import com.colo.persist.UserDAO;

public class CouponServiceProcess implements CouponService {
	private static Logger logger = LoggerFactory.getLogger(CouponServiceProcess.class);
	CouponDAO cdao;
	UserCouponDAO ucdao;
	
	public CouponServiceProcess() {
		cdao = new CouponDAO();
		ucdao = new UserCouponDAO();
	}
	
	
	@Override
	public boolean couponRegist(CouponVO cvo) {
		return cdao.insert(cvo) > 0 ? true : false;
	}

	@Override
	public List<CouponVO> couponList() {
		return cdao.selectList();
	}

	@Override
	public boolean couponDelete(int cpno) {
		return cdao.delete(cpno) > 0 ? true : false;
	}


	@Override
	public boolean couponEdit(CouponVO cvo) {
		return cdao.update(cvo) > 0 ? true : false;
	}


	@Override
	public CouponVO couponDetail(int cpno) {
		return cdao.selectOne(cpno);
	}


	@Override
	public int couponInfo() {
		return cdao.selectOne();
	}


	// mno를 통해 couponList string 가져옴
	@Override
	public boolean couponAdd(int mno, int cpno) {
		List<UserCouponVO> couponList;
		List<Integer> list = new ArrayList<Integer>();
		int isUp = 0;
		// 유저가 가지고 있는 쿠폰 리스트를 가져온다
		couponList = ucdao.couponList(mno);
		// String이 null이 아니라면 가져온 couponList에서 숫자만 뽑아 list에 넣는다
		if (couponList != null) {
			for (int i = 0; i < couponList.size(); i++) {
				list.add(couponList.get(i).getCpno());
			}
			// 새로 추가하는 쿠폰 번호가 list에 있는지 확인한다 -> 없으면 넣고, 있으면 넣지 않는다
			if (!list.contains(cpno)) {
				isUp = ucdao.insert(new UserCouponVO(mno, cpno));
			} else {
				logger.info(cpno+"번 쿠폰은 이미 가지고 있는 쿠폰 번호입니다");
			}
		} else {
			isUp = ucdao.insert(new UserCouponVO(mno, cpno));
		}
		return isUp > 0 ? true : false;
	}


	

}
