package com.shop.user.dao;



import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.InquiryInfoVO;


@MapperScan(basePackages="com.shop.user.dao")
public interface InquiryDao {
	
	public List<InquiryInfoVO> selectInquiryList(InquiryInfoVO vo) throws Exception;
	
	public InquiryInfoVO selectInquiryInfo(InquiryInfoVO vo) throws Exception;
	
	public int updateReply(InquiryInfoVO vo) throws Exception;


}

