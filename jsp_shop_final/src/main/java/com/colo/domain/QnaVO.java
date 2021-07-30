package com.colo.domain;

public class QnaVO {
	private int qno;
	private String qna_category;
	private String qna_content;
	private String qna_date;
	private String qna_pwd;
	private String qna_writer;
	private int pno;

	public QnaVO() {
	}

	// update
	public QnaVO(int qno, String qna_category, String qna_content, String qna_pwd) {
		this.qno = qno;
		this.qna_category = qna_category;
		this.qna_content = qna_content;
		this.qna_pwd = qna_pwd;
	}

	// list
	public QnaVO(int qno, String qna_category, String qna_date, String qna_writer, int pno) {
		this.qno = qno;
		this.qna_category = qna_category;
		this.qna_date = qna_date;
		this.qna_writer = qna_writer;
		this.pno = pno;
	}

	// insert
	public QnaVO(String qna_category, String qna_content, String qna_pwd, String qna_writer, int pno) {
		this.qna_category = qna_category;
		this.qna_content = qna_content;
		this.qna_pwd = qna_pwd;
		this.qna_writer = qna_writer;
		this.pno = pno;
	}

	// detail
	public QnaVO(int qno, String qna_category, String qna_content, String qna_date, String qna_pwd, String qna_writer,
			int pno) {
		this(qna_category, qna_content, qna_pwd, qna_writer, pno);
		this.qna_date = qna_date;
		this.qno = qno;

	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQna_category() {
		return qna_category;
	}

	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_pwd() {
		return qna_pwd;
	}

	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}

	public String getQna_writer() {
		return qna_writer;
	}

	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	@Override
	public String toString() {
		return "QnaVO [qno=" + qno + ", qna_category=" + qna_category + ", qna_content=" + qna_content + ", qna_date="
				+ qna_date + ", qna_pwd=" + qna_pwd + ", qna_writer=" + qna_writer + ", pno=" + pno + "]";
	}

}
