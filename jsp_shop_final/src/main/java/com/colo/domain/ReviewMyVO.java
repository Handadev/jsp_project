package com.colo.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReviewMyVO {
	private static Logger logger = LoggerFactory.getLogger(ReviewMyVO.class);
	private int rno;
	private int pno;
	private int price;
	private String title;
	private String rev_content;
	private String rev_date;
	private String rev_writer;
	
	// list
	public ReviewMyVO(int rno, int pno, String title, int price, String rev_content, String rev_date,
			String rev_writer) {
		this.rno = rno;
		this.pno = pno;
		this.price = price;
		this.title = title;
		this.rev_content = rev_content;
		this.rev_date = rev_date;
		this.rev_writer = rev_writer;
	}

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		ReviewMyVO.logger = logger;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
	
	
}
