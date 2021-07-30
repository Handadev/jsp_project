package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CouponVO;
import com.colo.domain.UserCouponVO;
import com.colo.orm.DBBuilder;

public class UserCouponDAO implements UserCouponDAORule {
	private static Logger logger = LoggerFactory.getLogger(UserCouponDAO.class);
	private SqlSession sql;
	private static String ns = "usercouponMapper.";
	
	public UserCouponDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(UserCouponVO ucvo) {
		int isUp = sql.insert(ns+"add", ucvo);
		if (isUp > 0) sql.commit();
		return isUp;
	}

	@Override
	public int delete(int cpno) {
		int isUp = sql.delete(ns+"delete", cpno);
		if (isUp > 0) sql.commit();
		return isUp;
	}

	@Override
	public List<UserCouponVO> couponList(int mno) {
		return sql.selectList(ns+"list", mno);
		
	}

	@Override
	public List<CouponVO> myCouponList(int mno) {
		SqlSession sql = DBBuilder.getFactory().openSession();
		List<CouponVO> list = sql.selectList(ns+"myCouponList", mno);
		logger.info("UserCouponDAO myCouponList"+list);
		logger.info("UserCouponDAO myCouponList = "+list.size());
		return list;
	}
	
	

}
