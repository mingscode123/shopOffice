package com.shop.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.login.dao.LoginDao;

@Service
public class LoginService {

	@Autowired
	LoginDao dao;
	
}
