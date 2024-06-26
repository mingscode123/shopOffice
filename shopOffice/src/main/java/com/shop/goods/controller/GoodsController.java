package com.shop.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.goods.service.CategoryService;
import com.shop.goods.service.GoodsService;
import com.shop.table.vo.CategoryInfoVO;
import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.SupplierInfoVo;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService service;
	
	@Autowired
	CategoryService cservice;
	

	@RequestMapping("/goods/goodsMain")
	public String category() throws Exception {
		return "goods/goodsMain";
	}
	
	@RequestMapping("/goods/searchGoods")
	@ResponseBody
	public List<GoodsInfoVO> searchGoods(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		List<GoodsInfoVO> list = service.selectGoodsList(vo);
		
		return list;
	}
	
	@RequestMapping("/goods/categoryChoose")
	@ResponseBody
	public List<CategoryInfoVO> categoryChoose(@ModelAttribute("CategoryInfoVO") CategoryInfoVO vo) throws Exception {
		List<CategoryInfoVO> list = cservice.selectCategoryList(vo);
		
		return list;
	}
	
	@RequestMapping("/goods/supplierName")
	@ResponseBody
	public List<SupplierInfoVo> supplierName(@ModelAttribute("SupplierInfoVO") SupplierInfoVo vo) throws Exception {
		List<SupplierInfoVo> list = service.selectSupplier(vo);
		
		return list;
	}
	
	@RequestMapping("/goods/goodsDetail")
	@ResponseBody
	public GoodsInfoVO goodsDetail(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		vo = service.selectGoodsInfo(vo);
		
		CategoryInfoVO cvo = new CategoryInfoVO();
		
		cvo.setCtLevel("2");
		cvo.setUpCtCd(vo.getTopCt());
		List<CategoryInfoVO> mlist = cservice.selectCategoryList(cvo);  //중
		
		cvo.setCtLevel("3");
		cvo.setUpCtCd(vo.getMiddleCt());
		List<CategoryInfoVO> slist = cservice.selectCategoryList(cvo);	//소
		
		vo.setmCategoryList(mlist);
		vo.setsCategoryList(slist);
		
		return vo;
	}
	
	@RequestMapping("/goods/updateGoodsDetail")
	@ResponseBody
	public int updateGoodsDetail(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		int cnt = service.updateGoodsDetail(vo);
		return cnt;
	}
	
	@RequestMapping("/goods/insertGoodsDetail")
	@ResponseBody
	public int insertGoodsDetail(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception {
		int cnt = service.insertGoodsDetail(vo);
		return cnt;
	}
}
