package com.colo.persist;

import java.util.List;

import com.colo.domain.CartVO;
import com.colo.domain.MnoPnoVO;

public interface CartDAORule {
	public int insert(CartVO cvo);
	public List<CartVO> selectList(int mno);
	public int delete(int cno);
	
	public List<CartVO> payList(int mno);
	public int payDelete(int mno);
	
	public int updateQuantity_incre(int cartno);
	public int updateQuantity_decre(int cartno);
	public int selectOne(MnoPnoVO mpvo);
	public int updateQuantity(int pno);
	public int update(CartVO cartvo);
	List<CartVO> selectList();
}
