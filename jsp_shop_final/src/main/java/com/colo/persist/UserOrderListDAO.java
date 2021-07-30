package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.colo.domain.UserOrderListVO;
import com.colo.orm.DBBuilder;

public class UserOrderListDAO implements UserOrderListDAORule {
	private SqlSession sql;
	private String ns = "orderMapper.";

	/* --------- DB 연결 ---------- */

	public UserOrderListDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	/* ---------- 유저 ----------- */

	@Override
	public int insert(UserOrderListVO ovo) {
		int isUp = sql.insert(ns + "add", ovo);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public List<UserOrderListVO> orderList(int mno) {
		SqlSession sql = DBBuilder.getFactory().openSession();
		return sql.selectList(ns + "list", mno);
	}

}
