package com.colo.service;

import java.util.List;

import com.colo.domain.UserOrderListVO;
import com.colo.domain.UserVO;

public interface UserService {
	

	/* -------유저------- */

	
	public boolean userRegist(UserVO uvo); // 회원가입

	public UserVO userLogin(UserVO uvo); // 로그인

	public boolean dupleIdCheck(String id); // 회원가입 시 아이디 중복 체크
	
	public boolean myUpdate(UserVO uvo); // 유저용 회원 정보 수정
	
	public boolean addOrderList(UserOrderListVO ovo); // 상품 구매시 구매내역 테이블에 추가
	
	public List<UserOrderListVO> orderList(int mno);
	

	/*------- 관리자 -------*/
	

	public List<UserVO> adminList(); // 관리자 메뉴 회원 리스트 불러오기

	public UserVO udList(int mno); // 수정버튼 누를 시 회원 디테일정보 불러오기

	public boolean userRemove(String id); // 유저 삭제

	public boolean userUpdate(UserVO uvo); // 유저 업데이트
}
