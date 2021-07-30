package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.colo.domain.UserVO;
import com.colo.orm.DBBuilder;

public class UserDAO implements UserDAORule {
	private SqlSession sql;
	private String ns = "userMapper.";

	
	
	/* --------- DB 연결 ---------- */

	
	
	public UserDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	
	
	
	/* ---------- 유저 ----------- */

	
	
	
	@Override
	public int insert(UserVO uvo) {
		int isUp = sql.insert(ns + "reg", uvo);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public UserVO selectOne(UserVO uvo) {
		return sql.selectOne(ns + "login", uvo);
	}

	@Override
	public int selectOne(String id) {
		return sql.selectOne(ns + "duple", id);
	}

	@Override
	public int usUpdate(UserVO uvo) {
		int isUp = sql.update(ns + "usUpdate", uvo);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}
	
	/* ------------- 관리자 -------------- */
	
	@Override
	public List<UserVO> adminList() {
		return sql.selectList(ns + "adminList");
	}

	@Override
	public int delete(String id) {
		int isUp = sql.delete(ns + "del", id);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public UserVO udList(int mno) {
		return sql.selectOne(ns + "udList", mno);
	}

	public int adUpdate(UserVO uvo) {
		int isUp = sql.update(ns + "adUpdate", uvo);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}


}
