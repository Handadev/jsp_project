package com.colo.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewMyVO;
import com.colo.domain.ReviewVO;
import com.colo.orm.FtpProcessor_qna;
import com.colo.persist.ReviewDAO;
import com.colo.persist.ReviewDAORule;

public class ReviewServiceProcessor implements ReviewService {
	private static Logger logger = LoggerFactory.getLogger(ReviewServiceProcessor.class);
	private ReviewDAORule rdao;

	public ReviewServiceProcessor() {
		rdao = new ReviewDAO();
	}

	@Override
	public boolean revRegist(ReviewVO rvo) {
		int isUp = rdao.insert(rvo);

		return isUp > 0 ? true : false;
	}

	@Override
	public List<ReviewVO> revList(int pno) {
		return rdao.selectRevList(pno);
	}

	@Override
	public boolean revEdit(ReviewVO rvo) {
		return rdao.update(rvo) > 0 ? true : false;
	}

	@Override
	public boolean revImgRegist(String rev_imginfo) {
		List<String> images = new ArrayList<String>();
		if (rev_imginfo.contains(",")) {
			String list[] = rev_imginfo.split(",");
			for (int i = 0; i < list.length; i++) {
				images.add(list[i]);
			}
		} else {
			images.add(rev_imginfo);
		}
		ReviewImgVO rivo = new ReviewImgVO();
		rivo.setRev_iname(images.get(images.size() - 1));

		int rno = rdao.selectOne();
		List<ReviewImgVO> rimgList = new ArrayList<>();
		for (int i = 0; i < images.size(); i++) {
			String imgName = images.get(i);
			rimgList.add(new ReviewImgVO(imgName, imgName.substring(imgName.lastIndexOf(".") + 1), rno));
		}
		return rdao.imgInsert(rimgList) > 0 ? true : false;
	}

	@Override
	public boolean revRemove(int rno) {
		List<ReviewImgVO> list = rdao.selectList(rno);
		FtpProcessor_qna fp = new FtpProcessor_qna();
		if (list.size() != 0) {
			boolean isDelFileFTP = fp.RevDeleteFile(list);
			logger.info(isDelFileFTP ? ">>> Review imgfile 삭제 성공!" : "%%% Review imgfile 삭제 실패!");
			boolean isDelFile = rdao.imgDelete(rno) > 0 ? true : false;
			logger.info(isDelFile ? ">>> Review img 테이블 삭제 성공!" : "%%% Review img 테이블 삭제 실패!");
			return isDelFile ? (rdao.delete(rno) > 0 ? true : false) : false;
		} else {
			return rdao.delete(rno) > 0 ? true : false;
		}
	}

	@Override
	public List<ReviewImgVO> revMyImgList() {
		return rdao.totalSelectList();
	}

	@Override
	public ReviewVO revDetail(int rno) {
		return rdao.selectOne(rno);
	}

	@Override
	public List<ReviewMyVO> revMyList(String rev_writer) {
		List<ReviewMyVO> list = rdao.selectMyList(rev_writer);
		logger.info("리뷰 서비스 프로세서 리스트~~~~~~~~~~~~~~~~~~~" + list);
		return list;
	}

	@Override
	public List<ReviewImgVO> revImgList(int rno) {
		return rdao.selectList(rno);
	}

}
