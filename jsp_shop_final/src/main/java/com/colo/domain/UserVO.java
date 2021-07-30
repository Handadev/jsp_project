package com.colo.domain;

public class UserVO {
	private int mno;
	private String id;
	private String pwd;
	private String name;
	private String birthday;
	private String address;
	private String phonenumber;
	private String signupdate;
	private String email;
	private int pro_point;
	private int grade;

	// 기본 생성자
	public UserVO() {
	}

	// 로그인
	public UserVO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	// 회원가입
	public UserVO(String id, String pwd, String name, String birthday, String address, String phonenumber,
			String email) {
		this(id, pwd);
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.phonenumber = phonenumber;
		this.email = email;
	}

	// 관리자용 리스트 불러오기
	
	public UserVO(int mno, String id, String name, String birthday, String address, String phonenumber,
			String signupdate, int pro_point, int grade, String email) {
		this.mno = mno;
		this.id = id;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.phonenumber = phonenumber;
		this.signupdate = signupdate;
		this.pro_point = pro_point;
		this.grade = grade;
		this.email = email;
	}

	// 업데이트(유저)
	
	public UserVO(int mno, String pwd, String phonenumber, String address, String email) {
		this.mno = mno;
		this.pwd = pwd;
		this.phonenumber = phonenumber;
		this.address = address;
		this.email = email;
	}

	// 유저 디테일 리스트
	
	public UserVO(String id, int pwd, String name, String address, String phonenumber, String signupdate, int pro_point,
			int grade, String email) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.phonenumber = phonenumber;
		this.signupdate = signupdate;
		this.pro_point = pro_point;
		this.grade = grade;
		this.email = email;
	}

	// 관리자 업데이트 디테일 리스트
	
	public UserVO(int mno, String id, String pwd, String name, String birthday, String phonenumber, String address,
			String signupdate, int pro_point, int grade, String email) {
		this.mno = mno;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.phonenumber = phonenumber;
		this.signupdate = signupdate;
		this.pro_point = pro_point;
		this.grade = grade;
		this.email = email;
	}

	// 관리자 업데이트
	
	public UserVO(String id, String pwd, String name, String birthday, String address, String phonenumber,
			String signupdate, int pro_point, int grade, String email) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.phonenumber = phonenumber;
		this.signupdate = signupdate;
		this.pro_point = pro_point;
		this.grade = grade;
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getSignupdate() {
		return signupdate;
	}

	public void setSignupdate(String signupdate) {
		this.signupdate = signupdate;
	}

	public int getPro_point() {
		return pro_point;
	}

	public void setPro_point(int pro_point) {
		this.pro_point = pro_point;
	}

	@Override
	public String toString() {
		return "UserVO [mno=" + mno + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birthday=" + birthday
				+ ", address=" + address + ", phonenumber=" + phonenumber + ", signupdate=" + signupdate + ", email="
				+ email + ", pro_point=" + pro_point + ", grade=" + grade + "]";
	}

}
