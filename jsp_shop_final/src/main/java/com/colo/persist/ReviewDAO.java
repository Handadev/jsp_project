package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewMyVO;
import com.colo.domain.ReviewVO;
import com.colo.orm.DBBuilder;

public class ReviewDAO implements ReviewDAORule {
	private static Logger logger = LoggerFactory.getLogger(ReviewDAO.class);
	private SqlSession sql;
	private String ns = "ReviewMapper.";

	public ReviewDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	@Override
	public int insert(ReviewVO rvo) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.insert(ns + "add", rvo);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public int update(ReviewVO rvo) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.update(ns + "mod", rvo);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public List<ReviewVO> selectRevList(int pno) {
		sql = DBBuilder.getFactory().openSession();
		List<ReviewVO> list = sql.selectList(ns + "list", pno);
		sql.close();
		return list;
	}

	@Override
	public int delete(int rno) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.delete(ns + "del", rno);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public int selectOne() {
		sql = DBBuilder.getFactory().openSession();
		int rno = sql.selectOne(ns + "lastRno");
		sql.close();
		return rno;
	}

	@Override
	public int imgInsert(List<ReviewImgVO> rimgList) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.insert(ns + "imgAdd", rimgList);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public List<ReviewImgVO> totalSelectList() {
		sql = DBBuilder.getFactory().openSession();
		List<ReviewImgVO> list = sql.selectList(ns + "imgList");
		sql.close();
		return list;

	}

	@Override
	public int imgDelete(int rno) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.delete(ns + "imgDel", rno);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public List<ReviewImgVO> selectList(int rno) {
		sql = DBBuilder.getFactory().openSession();
		List<ReviewImgVO> list = sql.selectList(ns + "imgName", rno);
		sql.close();
		return list;
	}

	@Override
	public ReviewVO selectOne(int rno) {
		sql = DBBuilder.getFactory().openSession();
		ReviewVO rvo = sql.selectOne(ns + "detail", rno);
		sql.close();
		return rvo;
	}

	@Override
	public List<ReviewMyVO> selectMyList(String rev_writer) {
		sql = DBBuilder.getFactory().openSession();
		List<ReviewMyVO> list = sql.selectList(ns + "myReview", rev_writer);
		sql.close();
		return list;
	}

}
