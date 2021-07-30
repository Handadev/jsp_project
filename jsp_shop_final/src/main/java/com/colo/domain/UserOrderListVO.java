package com.colo.domain;

public class UserOrderListVO {
	private int ono;
	private int mno;
	private int totalprice;
	private String productname;
	private String order_date;

	// 기본 생성자

	public UserOrderListVO() {
	}

	// db 추가
	public UserOrderListVO(int mno, int totalprice, String productname) {
		this.mno = mno;
		this.totalprice = totalprice;
		this.productname = productname;
	}

	// 리스트 출력
	public UserOrderListVO(int ono, int mno, int totalprice, String productname, String order_date) {
		this.ono = ono;
		this.mno = mno;
		this.totalprice = totalprice;
		this.productname = productname;
		this.order_date = order_date;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	
}
