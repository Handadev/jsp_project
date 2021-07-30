package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.QnaImgVO;
import com.colo.domain.QnaVO;
import com.colo.orm.DBBuilder;

public class QnaDAO implements QnaDAORule {
	private static Logger logger = LoggerFactory.getLogger(QnaDAO.class);
	private SqlSession sql;
	private String ns = "QnaMapper.";

	public QnaDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	@Override
	public int insert(QnaVO qvo) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.insert(ns + "add", qvo);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public int update(QnaVO qvo) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.update(ns + "mod", qvo);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public QnaVO selectOne(int qno) {
		sql = DBBuilder.getFactory().openSession();
		QnaVO qvo = sql.selectOne(ns + "detail", qno);
		sql.close();
		return qvo;
	}

	@Override
	public List<QnaVO> selectProductList(int pno) {
		sql = DBBuilder.getFactory().openSession();
		List<QnaVO> list = sql.selectList(ns + "list", pno);
		sql.close();
		return list;

	}

	@Override
	public int delete(int qno) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.delete(ns + "del", qno);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public int imgDelete(int qno) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.delete(ns + "imgDel", qno);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public int selectOne() {
		sql = DBBuilder.getFactory().openSession();
		int qno = sql.selectOne(ns + "lastQno");
		sql.close();
		return qno;
	}

	@Override
	public int imgInsert(List<QnaImgVO> qimgList) {
		sql = DBBuilder.getFactory().openSession();
		int isUp = sql.insert(ns + "imgAdd", qimgList);
		if (isUp > 0)
			sql.commit();
		sql.close();
		return isUp;
	}

	@Override
	public List<QnaImgVO> selectList(int qno) {
		sql = DBBuilder.getFactory().openSession();
		List<QnaImgVO> list = sql.selectList(ns + "imgList", qno);
		sql.close();
		return list;
	}

}
