package com.shop.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.user.dao.UserDao;

@Service
public class UserService {

	@Autowired
	UserDao dao;
	
	public List<UserInfoVO> selectUserList(UserInfoVO vo) throws Exception{
		return dao.selectUserList(vo);
	}
	
	public UserInfoVO selectUserInfo(UserInfoVO vo) throws Exception{
		return dao.selectUserInfo(vo);
	}
	
	public List<OrderInfoVO> selectOrderList(UserInfoVO vo) throws Exception{
		return dao.selectOrderList(vo);
	}
	
	
	
	
}
