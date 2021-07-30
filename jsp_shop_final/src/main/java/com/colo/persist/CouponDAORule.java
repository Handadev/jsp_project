package com.colo.persist;

import java.util.List;

import com.colo.domain.CouponVO;

public interface CouponDAORule {
	public int insert(CouponVO cvo);
	public List<CouponVO> selectList();
	public int delete(int cpno);
	public int update(CouponVO cvo);
	public CouponVO selectOne(int cpno);
	public int selectOne();
}
