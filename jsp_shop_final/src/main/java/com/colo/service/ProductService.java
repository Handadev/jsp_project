package com.colo.service;

import java.util.List;

import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;

public interface ProductService {
	public boolean productRegist(ProductVO pvo); 
	public List<ProductVO> productList();
	public ProductVO productInfo(int pno); // 디테일(상세보기)
	public boolean productEdit(ProductVO pvo, int mno);
	public boolean productRemove(int pno);
	public List<ProductImgVO> imgList(int pno);
	public boolean fileRemove(int pnoModifySave);
	public List<ProductVO> productSearch(String title);
}
