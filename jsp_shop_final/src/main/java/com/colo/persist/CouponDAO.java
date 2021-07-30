package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CouponVO;
import com.colo.orm.DBBuilder;

public class CouponDAO implements CouponDAORule {
	private static Logger logger = LoggerFactory.getLogger(CouponDAO.class);
	private SqlSession sql;
	private static String ns = "couponMapper.";
	
	public CouponDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}
	
	@Override
	public int insert(CouponVO cvo) {
		int isUp = sql.insert(ns+"add", cvo);
		if (isUp > 0) sql.commit();
		return isUp;
	}

	@Override
	public List<CouponVO> selectList() {
		return sql.selectList(ns+"list");
	}

	@Override
	public int delete(int cpno) {
		int isUp = sql.delete(ns+"del", cpno);
		if (isUp > 0) sql.commit();
		return isUp;
	}

	@Override
	public int update(CouponVO cvo) {
		int isUp = sql.update(ns+"mod", cvo);
		if (isUp > 0) sql.commit();
		return isUp;
	}

	@Override
	public CouponVO selectOne(int cpno) {
		return sql.selectOne(ns+"detail", cpno);
	}

	@Override
	public int selectOne() {
		return sql.selectOne(ns+"last");
	}

}
