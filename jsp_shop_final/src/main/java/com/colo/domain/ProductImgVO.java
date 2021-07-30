package com.colo.domain;

public class ProductImgVO {

	private int ino;
	private String pd_iname;
	private String pd_itype;
	private String pd_iregdate;
	private int pno;
	
	public ProductImgVO() {} 
	
	// insert
	public ProductImgVO(int pno, String pd_iname, String pd_itype) {
		this.pno = pno;
		this.pd_iname = pd_iname;
		this.pd_itype = pd_itype;
	}

	// update, list
	public ProductImgVO(String pd_iname, String pd_itype, int ino) {
		this.pd_iname = pd_iname;
		this.pd_itype = pd_itype;
		this.ino = ino;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getPd_iname() {
		return pd_iname;
	}

	public void setPd_iname(String pd_iname) {
		this.pd_iname = pd_iname;
	}

	public String getPd_itype() {
		return pd_itype;
	}

	public void setPd_itype(String pd_itype) {
		this.pd_itype = pd_itype;
	}

	public String getPd_iregdate() {
		return pd_iregdate;
	}

	public void setPd_iregdate(String pd_iregdate) {
		this.pd_iregdate = pd_iregdate;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}
	
	
}
