package com.colo.service;

import java.util.List;

import com.colo.domain.CartVO;
import com.colo.domain.MnoPnoVO;

public interface CartService {
	public boolean cartRegist(CartVO cvo);
	public List<CartVO> cartList(int mno);
	public List<CartVO> payList(int mno);
	public boolean cartRemove(int cno);
	public boolean payRemove(int mno);
	public boolean quantityIncrement(int cartno);
	public boolean quantitydecrement(int cartno);
	public boolean dupleCheck(MnoPnoVO mpvo);
	public boolean onlyQuantityIncrement(int pno);

}
