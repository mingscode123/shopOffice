package com.shop.goods.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.goods.service.CategoryService;
import com.shop.table.vo.CategoryInfoVO;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryService service;
	
	
	@RequestMapping("/goods/category")
	public String category() throws Exception {
		return "goods/category";
	}
	
	
	@RequestMapping("/goods/searchCategory")
	@ResponseBody
	public List<CategoryInfoVO> searchCategory(@ModelAttribute("CategoryInfoVO") CategoryInfoVO vo) throws Exception {
		List<CategoryInfoVO> list = service.selectCategoryList(vo);
		
		return list;
	}
	
	@RequestMapping("/goods/categoryChange")
	@ResponseBody
	public List<CategoryInfoVO> categoryChange(@ModelAttribute("CategoryInfoVO") CategoryInfoVO vo) throws Exception {
		List<CategoryInfoVO> list = service.selectCategoryList(vo);
		
		return list;
	}
	
	@RequestMapping("/goods/newCategory")
	@ResponseBody
	public int newCategory(@ModelAttribute("CategoryInfoVO") CategoryInfoVO vo) throws Exception {
		int cnt = service.insertCategory(vo);
		return cnt;
	}
	
	@RequestMapping("/goods/updateCategory")
	@ResponseBody
	public int updateCategory(@ModelAttribute("CategoryInfoVO") CategoryInfoVO vo) throws Exception {
		int cnt = service.updateCategory(vo);
		return cnt;
	}
	
}
	