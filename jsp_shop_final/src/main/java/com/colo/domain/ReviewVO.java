package com.colo.domain;

import java.util.List;

public class ReviewVO {
	private int rno;
	private int pno;
	private String rev_content;
	private String rev_date;
	private String rev_writer;
	private List<ReviewImgVO> rev_imglist;

	public ReviewVO() {
	}

	// update
	public ReviewVO(int rno, String rev_content) {
		this.rno = rno;
		this.rev_content = rev_content;
	}

	// insert
	public ReviewVO(String rev_content, String rev_writer, int pno) {
		this.rev_content = rev_content;
		this.rev_writer = rev_writer;
		this.pno = pno;
	}

	// list
	public ReviewVO(int rno, int pno, String rev_content, String rev_date, String rev_writer) {
		this(rev_content, rev_writer, pno);
		this.rno = rno;
		this.rev_date = rev_date;
	}

// product list
	public ReviewVO(int rno, int pno, String rev_content, String rev_date, String rev_writer,
			List<ReviewImgVO> rev_imglist) {
		this(rno, pno, rev_content, rev_date, rev_writer);
		this.rev_imglist = rev_imglist;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getRev_date() {
		return rev_date;
	}

	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}

	public String getRev_writer() {
		return rev_writer;
	}

	public void setRev_writer(String rev_writer) {
		this.rev_writer = rev_writer;
	}

	public List<ReviewImgVO> getRev_imglist() {
		return rev_imglist;
	}

	public void setRev_imglist(List<ReviewImgVO> rev_imglist) {
		this.rev_imglist = rev_imglist;
	}

	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", pno=" + pno + ", rev_content=" + rev_content + ", rev_date=" + rev_date
				+ ", rev_writer=" + rev_writer + "]";
	}

}
