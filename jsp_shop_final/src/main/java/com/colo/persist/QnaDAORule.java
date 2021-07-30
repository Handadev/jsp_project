package com.colo.persist;

import java.util.List;

import com.colo.domain.QnaImgVO;
import com.colo.domain.QnaVO;

public interface QnaDAORule {
	// qna
	public int insert(QnaVO qvo);
	public int update(QnaVO qvo);
	public int delete(int qno);
	public QnaVO selectOne(int qno);
	public int selectOne();
	public List<QnaVO> selectProductList(int pno);
	// img
	public int imgInsert(List<QnaImgVO> qimgList);
	public List<QnaImgVO> selectList(int qno);
	public int imgDelete(int qno);

}
