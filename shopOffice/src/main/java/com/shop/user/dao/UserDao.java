package com.shop.user.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;

@MapperScan(basePackages="com.shop.user.dao")
public interface UserDao {

	public List<UserInfoVO> selectUserList(UserInfoVO vo) throws Exception;
	
	public UserInfoVO selectUserInfo(UserInfoVO vo) throws Exception;
	
	public List<OrderInfoVO> selectOrderList(UserInfoVO vo) throws Exception;
}

