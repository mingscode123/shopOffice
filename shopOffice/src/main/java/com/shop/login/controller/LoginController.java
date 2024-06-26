package com.shop.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService service;
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "login";
	}
}
