package com.colo.domain;

public class CartVO {
	private int cartno; 
	private int pno;
	private String imgfile;
	private String title;
	private int price;
	private int quantity;
	private int mno;
	
	// insert
	public CartVO(int pno, String imgfile, String title, int price, int mno) {
		this.pno = pno;
		this.imgfile = imgfile;
		this.title = title;
		this.price = price;
		this.mno = mno;
	}

	// list
	public CartVO(int cartno, int pno, String imgfile, String title, int price, int quantity, int mno) {
		this.cartno = cartno;
		this.pno = pno;
		this.imgfile = imgfile;
		this.title = title;
		this.price = price;
		this.quantity = quantity;
		this.mno = mno;
	}
	
	
//	// cart list
//	public CartVO(int pno, String imgfile, String title, int price, int quantity, int mno) {
//		this.pno = pno;
//		this.imgfile = imgfile;
//		this.title = title;
//		this.price = price;
//		this.quantity = quantity;
//		this.mno = mno;
//	}

	public int getCartno() {
		return cartno;
	}

	public void setCartno(int cartno) {
		this.cartno = cartno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getImgfile() {
		return imgfile;
	}

	public void setImgfile(String imgfile) {
		this.imgfile = imgfile;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}


	
	
	
	
	
	
}
