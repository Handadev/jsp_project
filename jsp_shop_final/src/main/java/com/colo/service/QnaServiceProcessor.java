package com.colo.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.ProductImgVO;
import com.colo.domain.QnaImgVO;
import com.colo.domain.QnaVO;
import com.colo.orm.FtpProcessor_qna;
import com.colo.persist.QnaDAO;
import com.colo.persist.QnaDAORule;
import com.mysql.fabric.xmlrpc.base.Array;


public class QnaServiceProcessor implements QnaService {
	private static Logger logger = LoggerFactory.getLogger(QnaServiceProcessor.class);
	private QnaDAORule qdao;

	public QnaServiceProcessor() {
		qdao = new QnaDAO();
	}

	@Override
	public boolean qnaRegist(QnaVO qvo) {
		int isUp = qdao.insert(qvo);

		return isUp > 0 ? true : false;
	}

	@Override
	public boolean qnaImgRegist(String qna_imginfo) {
		List<String> images = new ArrayList<String>();
		if (qna_imginfo.contains(",")) {
			String list[] = qna_imginfo.split(",");
			for (int i = 0; i < list.length; i++) {
				images.add(list[i]);
			}
		} else {
			images.add(qna_imginfo);
		}
		QnaImgVO qivo = new QnaImgVO();
		qivo.setQna_iname(images.get(images.size() - 1));

		int qno = qdao.selectOne();
		List<QnaImgVO> qimgList = new ArrayList<>();
		for (int i = 0; i < images.size(); i++) {
			String imgName = images.get(i);
			qimgList.add(new QnaImgVO(imgName, imgName.substring(imgName.lastIndexOf(".") + 1), qno));
		}
		return qdao.imgInsert(qimgList) > 0 ? true : false;
	}

	@Override
	public List<QnaVO> qnaList(int pno) {
		return qdao.selectProductList(pno);
	}

	@Override
	public QnaVO qnaDetail(int qno) {
		return qdao.selectOne(qno);
	}

	@Override
	public boolean qnaEdit(QnaVO qvo) {
		return qdao.update(qvo) > 0 ? true : false;
	}

	@Override
	public boolean qnaRemove(int qno) {
		List<QnaImgVO> list = qdao.selectList(qno);
		FtpProcessor_qna fp = new FtpProcessor_qna();
		if (list.size() != 0) {
			boolean isDelFileFTP = fp.QnaDeleteFile(list);
			logger.info(isDelFileFTP ? ">>> Qna imgfile 삭제 성공!" : "%%% Qna imgfile 삭제 실패!");
			boolean isDelFile = qdao.imgDelete(qno) > 0 ? true : false;
			logger.info(isDelFile ? ">>> Qna img 테이블 삭제 성공!" : "%%% Qna img 테이블 삭제 실패!");
			return isDelFile ? (qdao.delete(qno) > 0 ? true : false) : false;
		}else {
			return qdao.delete(qno) > 0 ? true : false;
		}
	}

	@Override
	public List<QnaImgVO> QnaImgList(int qno) {
		return qdao.selectList(qno);
	}

}
