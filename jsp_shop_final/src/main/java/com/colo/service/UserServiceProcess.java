package com.colo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.colo.domain.UserOrderListVO;
import com.colo.domain.UserVO;
import com.colo.persist.UserDAO;
import com.colo.persist.UserOrderListDAO;

public class UserServiceProcess implements UserService {
	private static Logger logger = LoggerFactory.getLogger(UserServiceProcess.class);
	private UserDAO udao;
	private UserOrderListDAO odao;

	public UserServiceProcess() {
		udao = new UserDAO();
		odao = new UserOrderListDAO();
	}

	
	/*-------------- 유저 ---------------*/

	
	@Override
	public boolean userRegist(UserVO uvo) {
		return udao.insert(uvo) > 0 ? true : false;
	}

	@Override
	public UserVO userLogin(UserVO uvo) {
		return udao.selectOne(uvo);
	}

	@Override
	public boolean dupleIdCheck(String id) {
		return udao.selectOne(id) > 0 ? true : false;
	}

	@Override
	public boolean myUpdate(UserVO uvo) {
		return udao.usUpdate(uvo) > 0 ? true : false;
	}	
	
	
	@Override
	public boolean addOrderList(UserOrderListVO ovo) {
		return odao.insert(ovo) > 0 ? true : false;
	}
	
	@Override
	public List<UserOrderListVO> orderList(int mno) {
		return odao.orderList(mno);
	}
	
	
	/*-------------- 관리자 ---------------*/
	
	
	@Override
	public List<UserVO> adminList() {
		return udao.adminList();
	}

	@Override
	public UserVO udList(int mno) {
		return udao.udList(mno);
	}

	@Override
	public boolean userRemove(String id) {
		return udao.delete(id) > 0 ? true : false;
	}

	@Override
	public boolean userUpdate(UserVO uvo) {
		return udao.adUpdate(uvo) > 0 ? true : false;
	}

}
