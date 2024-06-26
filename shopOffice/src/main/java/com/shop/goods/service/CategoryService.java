package com.shop.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goods.dao.CategoryDao;
import com.shop.table.vo.CategoryInfoVO;


@Service
public class CategoryService {

	@Autowired
	CategoryDao dao;
	
	public List<CategoryInfoVO> selectCategoryList(CategoryInfoVO vo) throws Exception{
		return dao.selectCategoryList(vo);
	}
	
	public int insertCategory(CategoryInfoVO vo) throws Exception{
		return dao.insertCategory(vo);
	}
	
	public int updateCategory(CategoryInfoVO vo) throws Exception{
		return dao.updateCategory(vo);
	}
	
	
	
}
