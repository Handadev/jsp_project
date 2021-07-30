package com.colo.persist;

import java.util.List;

import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;

public interface ProductDAORule {
	// product
	public int insert(ProductVO pvo);
	public List<ProductVO> selectList();
	public ProductVO selectOne(int pno);
	public int selectOne();
	public int update(ProductVO pvo);
	public int delete(int pno);
	public List<ProductVO> selectList(String title);
	
	// images
	public int insert(List<ProductImgVO> imgList);
	public List<ProductImgVO> selectList(int pno);
	public int fileDelete(int pno);
}
