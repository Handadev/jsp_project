package com.colo.service;

import java.util.List;

import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewMyVO;
import com.colo.domain.ReviewVO;

public interface ReviewService {
	public boolean revRegist(ReviewVO rvo);
	public boolean revImgRegist(String rev_imginfo);
	public List<ReviewVO> revList(int pno);
	public ReviewVO revDetail(int rno);
	public boolean revEdit(ReviewVO rvo);
	public boolean revRemove(int rno);
	public List<ReviewImgVO> revImgList(int rno);
	public List<ReviewImgVO> revMyImgList();
	public List<ReviewMyVO> revMyList(String rev_writer);
}
