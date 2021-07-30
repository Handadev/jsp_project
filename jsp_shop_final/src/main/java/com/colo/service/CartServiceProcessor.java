package com.colo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.CartVO;
import com.colo.domain.MnoPnoVO;
import com.colo.persist.CartDAO;
import com.colo.persist.CartDAORule;

public class CartServiceProcessor implements CartService {
	private static Logger logger = LoggerFactory.getLogger(CartServiceProcessor.class);
	private CartDAORule cartDao;

	public CartServiceProcessor() {
		cartDao = new CartDAO();
	}

	@Override
	public boolean cartRegist(CartVO cvo) {
		int isUp = cartDao.insert(cvo);
		return isUp > 0 ? true : false;
	}

	@Override
	public List<CartVO> cartList(int mno) {
		return cartDao.selectList(mno);
	}
	@Override
	public List<CartVO> payList(int mno) {
		return cartDao.payList(mno);
	}

	@Override
	public boolean cartRemove(int cno) {
		int isUp = cartDao.delete(cno);
		return isUp > 0 ? true : false;
	}
	@Override
	public boolean payRemove(int mno) {
		int isUp = cartDao.payDelete(mno);
		return isUp > 0 ? true : false;
	}

	@Override
	public boolean quantityIncrement(int cartno) {
		int isUp = cartDao.updateQuantity_incre(cartno);
		return isUp > 0 ? true : false;
	}

	@Override
	public boolean quantitydecrement(int cartno) {
		int isUp = cartDao.updateQuantity_decre(cartno);
		return isUp > 0 ? true : false;
	}

	@Override
	public boolean dupleCheck(MnoPnoVO mpvo) {
		return cartDao.selectOne(mpvo) > 0 ? true : false;
	}
	
	@Override
	public boolean onlyQuantityIncrement(int pno) {
		int isUp = cartDao.updateQuantity(pno);
		return isUp > 0 ? true : false;
	}



}
