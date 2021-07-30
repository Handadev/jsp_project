package com.colo.persist;

import java.util.List;

import com.colo.domain.UserVO;

public interface UserDAORule {
	
	
	
	/* ------ 유저용 ------- */
	
	
	
	public int insert(UserVO uvo); //회원가입시 사용

	public UserVO selectOne(UserVO uvo); // 로그인

	public int selectOne(String id); // 아이디 중복 체크시 사용

	public int usUpdate(UserVO uvo); // 유저용 업데이트시 사용
	
	
	
	
	/* ------ 관리자 ------ */
	
	
	
	
	public List<UserVO> adminList(); //관리자메뉴에서 회원 리스트 조회시 사용

	public UserVO udList(int mno); // 관리자메뉴 - 회원정보 수정시 불러오는 디테일 페이지 사용

	public int delete(String id); // 회원 삭제시 사용
	
	public int adUpdate(UserVO uvo); // 관리자용 업데이트시 사용
	
}
