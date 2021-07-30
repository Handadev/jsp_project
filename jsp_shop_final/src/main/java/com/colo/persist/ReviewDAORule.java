package com.colo.persist;

import java.util.List;

import com.colo.domain.ReviewImgVO;
import com.colo.domain.ReviewMyVO;
import com.colo.domain.ReviewVO;

public interface ReviewDAORule {
	// review
	public int insert(ReviewVO rvo);
	public int update(ReviewVO rvo);
	public int delete(int rno);
	public ReviewVO selectOne(int rno);
	public int selectOne();
	public List<ReviewVO> selectRevList(int pno);
	// img
	public int imgInsert(List<ReviewImgVO> rimgList);
	public List<ReviewImgVO> totalSelectList(); //전체 리뷰 이미지 리스트 가져오기
	public List<ReviewImgVO> selectList(int rno); //rno에 맞는 이미지 리스트 가져오기
	public int imgDelete(int rno);
	public List<ReviewMyVO> selectMyList(String rev_writer); //내가 쓴 리뷰 이미지
}
