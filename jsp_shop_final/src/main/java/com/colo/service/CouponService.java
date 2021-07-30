package com.colo.service;

import java.util.List;

import com.colo.domain.CouponVO;

public interface CouponService {
	public boolean couponRegist(CouponVO cvo);
	public List<CouponVO> couponList();
	public boolean couponDelete(int cpno);
	public boolean couponEdit(CouponVO cvo);
	public CouponVO couponDetail(int cpno);
	public int couponInfo();
	public boolean couponAdd(int mno, int cpno); 
}
