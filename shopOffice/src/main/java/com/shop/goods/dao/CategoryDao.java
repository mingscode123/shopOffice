package com.shop.goods.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.CategoryInfoVO;


@MapperScan(basePackages="com.shop.goods.dao")
public interface CategoryDao {
	
	public List<CategoryInfoVO> selectCategoryList(CategoryInfoVO vo) throws Exception;
	
	public int insertCategory(CategoryInfoVO vo) throws Exception;
	
	public int updateCategory(CategoryInfoVO vo) throws Exception;
	
	public List<CategoryInfoVO> selectmCategoryList(CategoryInfoVO vo) throws Exception;
	
	public List<CategoryInfoVO> selectsCategoryList(CategoryInfoVO vo) throws Exception;
	
}
