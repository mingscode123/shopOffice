package com.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.user.service.UserService;

@Controller

public class UserController {

	@Autowired
	UserService service;
	
	@RequestMapping("/user/list")
	public String list() throws Exception {
		 System.out.println("사용자관리controller"); 
		return "user/list";
	}
	
	@RequestMapping("/user/searchlist")
	@ResponseBody
	public List<UserInfoVO> searchlist(@ModelAttribute("UserInfoVO") UserInfoVO vo) throws Exception {
		List<UserInfoVO> list = service.selectUserList(vo);
		
		return list;
	}
	
	@RequestMapping("/user/userDetail")
	@ResponseBody
	public UserInfoVO userDetail(@ModelAttribute("UserInfoVO") UserInfoVO vo) throws Exception {
		vo = service.selectUserInfo(vo);
		
		List<OrderInfoVO> list = service.selectOrderList(vo);
		
		vo.setOrderlist(list);
		
		return vo;
	}
}
