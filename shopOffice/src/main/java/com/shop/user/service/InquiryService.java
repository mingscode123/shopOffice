package com.shop.user.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.table.vo.InquiryInfoVO;
import com.shop.user.dao.InquiryDao;


@Service
public class InquiryService {

	@Autowired
	InquiryDao dao;
	
	public List<InquiryInfoVO> selectInquiryList(InquiryInfoVO vo) throws Exception{
		return dao.selectInquiryList(vo);
	}
	
	public InquiryInfoVO selectInquiryInfo(InquiryInfoVO vo) throws Exception{
		return dao.selectInquiryInfo(vo);
	}
	
	public int updateReply(InquiryInfoVO vo) throws Exception{
		return dao.updateReply(vo);
	}
	
	
	
	
	
	
}
