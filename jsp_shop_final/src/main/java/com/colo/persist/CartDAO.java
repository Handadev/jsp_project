package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CartVO;
import com.colo.domain.MnoPnoVO;
import com.colo.orm.DBBuilder;

public class CartDAO implements CartDAORule {
	private static Logger logger = LoggerFactory.getLogger(CartDAO.class);
	private SqlSession sql;
	private static String ns = "CartMapper.";

	public CartDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	@Override
	public int insert(CartVO cvo) {
		int isUp = sql.insert(ns + "add", cvo);
		if (isUp > 0)
			sql.commit();
		logger.info(isUp > 0 ? "DAO 추가 성공" : "DAO 추가 실패");
		return isUp;
	}

	@Override
	public List<CartVO> selectList(int mno) {
		SqlSession sql = DBBuilder.getFactory().openSession();
		return sql.selectList(ns + "list", mno);
	}

	@Override
	public List<CartVO> payList(int mno) {
		return sql.selectList(ns + "payList", mno);
	}

	@Override
	public int delete(int cno) {
		int isUp = sql.delete(ns + "delete", cno);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public int payDelete(int mno) {
		int isUp = sql.delete(ns + "payDelete", mno);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public int updateQuantity_incre(int cartno) {
		int isUp = sql.update(ns + "quantityIncrement", cartno);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public int updateQuantity_decre(int cartno) {
		int isUp = sql.update(ns + "quantityDecrement", cartno);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public int selectOne(MnoPnoVO mpvo) {
		return sql.selectOne(ns + "duple", mpvo);
	}

	@Override
	public int updateQuantity(int pno) {
		int isUp = sql.update(ns + "quantityIncrement2", pno);
		if (isUp > 0)
			sql.commit();
		logger.info(isUp > 0 ? "★★★★★★★★★★★★★★★DAO 추가 성공" : "★★★★★★★★★★★★★★★DAO 추가 실패");
		return isUp;
	}

	@Override
	public int update(CartVO cartvo) {
		int isUp = sql.update(ns + "cartUpdate", cartvo);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public List<CartVO> selectList() {
		return sql.selectList(ns + "list");
	}

}
