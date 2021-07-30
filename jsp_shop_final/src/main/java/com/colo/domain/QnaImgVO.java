package com.colo.domain;

public class QnaImgVO {
	private int qino;
	private String qna_iname;
	private String qna_itype;
	private String qna_iregdate;
	private int qno;

	public QnaImgVO() {
	}

	// insert
	public QnaImgVO(String qna_iname, String qna_itype, int qno) {
		this.qna_iname = qna_iname;
		this.qna_itype = qna_itype;
		this.qno = qno;
	}

	// list
	public QnaImgVO(String qna_iname) {
		this.qna_iname = qna_iname;
	}

	public int getQino() {
		return qino;
	}

	public void setQino(int qino) {
		this.qino = qino;
	}

	public String getQna_iname() {
		return qna_iname;
	}

	public void setQna_iname(String qna_iname) {
		this.qna_iname = qna_iname;
	}

	public String getQna_itype() {
		return qna_itype;
	}

	public void setQna_itype(String qna_itype) {
		this.qna_itype = qna_itype;
	}

	public String getQna_iregdate() {
		return qna_iregdate;
	}

	public void setQna_iregdate(String qna_iregdate) {
		this.qna_iregdate = qna_iregdate;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	@Override
	public String toString() {
		return "QnaImgVO [qino=" + qino + ", qna_iname=" + qna_iname + ", qna_itype=" + qna_itype + ", qna_iregdate="
				+ qna_iregdate + ", qno=" + qno + "]";
	}

}
