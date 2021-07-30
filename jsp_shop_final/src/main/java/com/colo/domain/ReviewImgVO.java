package com.colo.domain;

public class ReviewImgVO {
	private int rino;
	private String rev_iname;
	private String rev_itype;
	private String rev_iregdate;
	private int rno;

	public ReviewImgVO() {
	}

	// insert
	public ReviewImgVO(String rev_iname, String rev_itype, int rno) {
		this.rev_iname = rev_iname;
		this.rev_itype = rev_itype;
		this.rno = rno;
	}

	// list
	public ReviewImgVO(int rino, String rev_iname, int rno) {
		this.rino = rino;
		this.rev_iname = rev_iname;
		this.rno = rno;
	}

	public int getRino() {
		return rino;
	}

	public void setRino(int rino) {
		this.rino = rino;
	}

	public String getRev_iname() {
		return rev_iname;
	}

	public void setRev_iname(String rev_iname) {
		this.rev_iname = rev_iname;
	}

	public String getRev_itype() {
		return rev_itype;
	}

	public void setRev_itype(String rev_itype) {
		this.rev_itype = rev_itype;
	}

	public String getRev_iregdate() {
		return rev_iregdate;
	}

	public void setRev_iregdate(String rev_iregdate) {
		this.rev_iregdate = rev_iregdate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	@Override
	public String toString() {
		return "ReviewImgVO [rino=" + rino + ", rev_iname=" + rev_iname + ", rev_itype=" + rev_itype + ", rev_iregdate="
				+ rev_iregdate + ", rno=" + rno + "]";
	}

}
