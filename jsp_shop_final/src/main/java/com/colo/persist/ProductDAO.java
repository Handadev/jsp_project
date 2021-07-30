package com.colo.persist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;
import com.colo.orm.DBBuilder;

public class ProductDAO implements ProductDAORule {
	private static Logger logger = LoggerFactory.getLogger(ProductDAO.class);
	private SqlSession sql;
	private static String ns = "ProductMapper.";

	public ProductDAO() {
		new DBBuilder();
		sql = DBBuilder.getFactory().openSession();
	}

	@Override
	public int insert(ProductVO pvo) {
		int isUp = sql.insert(ns + "add", pvo);
		if (isUp > 0)
			sql.commit();
		logger.info(isUp > 0 ? "DAO 추가 성공" : "DAO 추가 실패");
		return isUp;
	}

	@Override
	public List<ProductVO> selectList() {
		return sql.selectList(ns + "list");
	}

	@Override
	public ProductVO selectOne(int pno) {
		return sql.selectOne(ns + "detail", pno);
	}

	@Override
	public int update(ProductVO pvo) {
		int isUp = sql.update(ns + "modify", pvo);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public int delete(int pno) {
		int isUp = sql.delete(ns + "delete", pno);
		isUp = sql.delete(ns + "imgDelete", pno);
		if (isUp > 0) sql.commit();
		return isUp;
	}

	@Override
	public int insert(List<ProductImgVO> imgList) {
		int isUp = sql.insert(ns + "imgAdd", imgList);
		if (isUp > 0)
			sql.commit();
		return isUp;
	}

	@Override
	public List<ProductImgVO> selectList(int pno) {
		return sql.selectList(ns + "imgList", pno);
	}

	@Override
	public int selectOne() {
		return sql.selectOne(ns + "lastPno");
	}

	@Override
	public int fileDelete(int pno) {
		int isUp = sql.delete(ns + "imgDelete", pno);
		if (isUp > 0) sql.commit();
		return isUp;
	}
	
	@Override
	   public List<ProductVO> selectList(String title) {
	      return sql.selectList(ns + "searchList", title);
	   }
}
