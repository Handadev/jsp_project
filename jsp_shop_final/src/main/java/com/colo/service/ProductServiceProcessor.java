package com.colo.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CartVO;
import com.colo.domain.ProductImgVO;
import com.colo.domain.ProductVO;
import com.colo.orm.FtpProcessor_product;
import com.colo.persist.CartDAO;
import com.colo.persist.CartDAORule;
import com.colo.persist.ProductDAO;
import com.colo.persist.ProductDAORule;

public class ProductServiceProcessor implements ProductService {
	private static Logger logger = LoggerFactory.getLogger(ProductServiceProcessor.class);
	private ProductDAORule pdao;
	private CartDAORule cartDao;

	public ProductServiceProcessor() {
		pdao = new ProductDAO();
		cartDao = new CartDAO();

	}

	@Override
	public boolean productRegist(ProductVO pvo) {
		List<String> imageNames = new ArrayList<String>();
		for (int i = 0; i < 3; i++) {
			imageNames.add(pvo.getImgfile().split(",")[i]);
		}
		pvo.setImgfile(imageNames.get(2)); // 대표 이미지파일 설정

		int isUp = pdao.insert(pvo);
		int pno = 0;
		if (isUp > 0) {
			// isUp = 1 제대로 들어감
			pno = pdao.selectOne(); // lastPno
		}
		List<ProductImgVO> imgList = new ArrayList<>();
		for (int i = 0; i < imageNames.size(); i++) {
			String imgName = imageNames.get(i);
			imgList.add(new ProductImgVO(pno, imgName, imgName.substring(imgName.lastIndexOf(".") + 1)));
		}
		return pdao.insert(imgList) > 0 ? true : false;
	}

	@Override
	public List<ProductVO> productList() {
		return pdao.selectList();
	}

	@Override
	public ProductVO productInfo(int pno) {
		return pdao.selectOne(pno);
	}

	@Override
	public boolean productEdit(ProductVO pvo, int mno) {
		List<String> imageNames = new ArrayList<String>();
		for (int i = 0; i < 3; i++) {
			imageNames.add(pvo.getImgfile().split(",")[i]);
		}
		pvo.setImgfile(imageNames.get(2)); // 대표 이미지파일 설정
		
		CartVO cartvo = new CartVO(pvo.getPno(), imageNames.get(2), pvo.getTitle(), pvo.getPrice(),mno); 
		int cartUpdate = cartDao.update(cartvo);
		logger.info(cartUpdate > 0 ? "$$$ 성공-카트수정" : "!!! 실패-카트수정");
		
		int isUp = pdao.update(pvo);
		int pno = 0;
		if (isUp > 0) {
			pno = pdao.selectOne();
		}
		List<ProductImgVO> imgList = new ArrayList<>();
		for (int i = 0; i < imageNames.size(); i++) {
			String imgName = imageNames.get(i);
			imgList.add(new ProductImgVO(pno, imgName, imgName.substring(imgName.lastIndexOf(".") + 1)));
		}
		return pdao.insert(imgList) > 0 ? true : false;
	}

	@Override
	public boolean productRemove(int pno) {
		List<ProductImgVO> list = pdao.selectList(pno);
		FtpProcessor_product fp = new FtpProcessor_product();
		boolean isDel = fp.delete(list);
		logger.info(isDel ? "$$$ 성공 - 파일질라 항목 삭제" : "!!! 실패 - 파일질라 항목 삭제");
		return isDel ? (pdao.delete(pno) > 0 ? true : false) : false;
	}

	@Override
	public List<ProductImgVO> imgList(int pno) {
		return pdao.selectList(pno);
	}

	@Override
	public boolean fileRemove(int pno) {
		List<ProductImgVO> list = pdao.selectList(pno);
		FtpProcessor_product fp = new FtpProcessor_product();
		boolean isDel = fp.delete(list);
		logger.info(isDel ? "$$$ 성공 - 파일질라 항목 삭제" : "!!! 실패 - 파일질라 항목 삭제");
		return isDel ? (pdao.fileDelete(pno) > 0 ? true : false) : false;
	}
	@Override
	   public List<ProductVO> productSearch(String title) {
	      return pdao.selectList(title);
	   }

}
