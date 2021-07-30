package com.colo.service;

import java.util.List;

import com.colo.domain.QnaImgVO;
import com.colo.domain.QnaVO;

public interface QnaService {
	public boolean qnaRegist(QnaVO qvo);
	public boolean qnaImgRegist(String qna_imginfo);
	public List<QnaVO> qnaList(int Pno);
	public QnaVO qnaDetail(int qno);
	public boolean qnaEdit(QnaVO qvo);
	public boolean qnaRemove(int qno);
	public List<QnaImgVO> QnaImgList(int qno);
}
