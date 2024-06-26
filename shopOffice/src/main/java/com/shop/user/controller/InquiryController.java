package com.shop.user.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.table.vo.InquiryInfoVO;
import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.user.service.InquiryService;

@Controller

public class InquiryController {

	@Autowired
	InquiryService service;
	
	@RequestMapping("/user/inquiry")
	public String list() throws Exception {
		return "user/inquiry";
	} //기본문의화면
	
	@RequestMapping("/user/searchinquiry")
	@ResponseBody
	public List<InquiryInfoVO> searchinquiry(@ModelAttribute("InquiryVO") InquiryInfoVO vo) throws Exception {
		List<InquiryInfoVO> list = service.selectInquiryList(vo);
		
		return list;
	} //문의리스트 불러오기
	
	@RequestMapping("/user/inquiryDetail")
	@ResponseBody
	public InquiryInfoVO inquiryDetail(@ModelAttribute("InquiryVO") InquiryInfoVO vo) throws Exception {
		vo = service.selectInquiryInfo(vo);
		return vo;
	} // 상세문의보기
	
	@RequestMapping("/user/updateReply")
	@ResponseBody
	public int updateReply(@ModelAttribute("InquiryVO") InquiryInfoVO vo) throws Exception {
		int cnt = service.updateReply(vo);
		return cnt;
	} //답변내용업데이트
	
	
	
}
