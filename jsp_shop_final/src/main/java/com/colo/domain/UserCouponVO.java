package com.colo.domain;


public class UserCouponVO {
	private int mno;
	private int cpno;
	
	public UserCouponVO() {
	}

	public UserCouponVO(int mno, int cpno) {
		super();
		this.mno = mno;
		this.cpno = cpno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getCpno() {
		return cpno;
	}

	public void setCpno(int cpno) {
		this.cpno = cpno;
	}

	@Override
	public String toString() {
		return "UserCouponVO [mno=" + mno + ", cpno=" + cpno + "]";
	}
	
	
}
