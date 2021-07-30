package com.colo.domain;

public class CouponVO {
	int cpno;
	String cp_name;
	String cp_enddate;
	int cp_discount;

	public CouponVO() {
	}

	// insert
	public CouponVO(String cp_name, String cp_enddate, int cp_discount) {
		this.cp_name = cp_name;
		this.cp_enddate = cp_enddate;
		this.cp_discount = cp_discount;
	}

	// list, modify
	public CouponVO(int cpno, String cp_name, String cp_enddate, int cp_discount) {
		this(cp_name, cp_enddate, cp_discount);
		this.cpno = cpno;
	}

	public int getCpno() {
		return cpno;
	}

	public void setCpno(int cpno) {
		this.cpno = cpno;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getCp_enddate() {
		return cp_enddate;
	}

	public void setCp_enddate(String cp_enddate) {
		this.cp_enddate = cp_enddate;
	}

	public int getCp_discount() {
		return cp_discount;
	}

	public void setCp_discount(int cp_discount) {
		this.cp_discount = cp_discount;
	}

	@Override
	public String toString() {
		return "CouponVO [cpno=" + cpno + ", cp_enddate=" + cp_enddate + ", cp_discount=" + cp_discount + "]";
	}

}
