package com.shop.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goods.dao.CategoryDao;
import com.shop.goods.dao.GoodsDao;
import com.shop.table.vo.CategoryInfoVO;
import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.SupplierInfoVo;

@Service
public class GoodsService {
	
	@Autowired
	GoodsDao dao;
	@Autowired
	CategoryDao cdao;
	
	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO vo) throws Exception{
		return dao.selectGoodsList(vo);
	}
	
	public List<CategoryInfoVO> selectCategoryList(CategoryInfoVO vo) throws Exception{
		return cdao.selectCategoryList(vo);
	}
	
	public List<SupplierInfoVo> selectSupplier(SupplierInfoVo vo) throws Exception{
		return dao.selectSupplier(vo);
	}
	
	public List<GoodsInfoVO> selectGoodsInfoList(GoodsInfoVO vo) throws Exception{
		return dao.selectGoodsInfoList(vo);
	}

	public GoodsInfoVO selectGoodsInfo(GoodsInfoVO vo) throws Exception{
		return dao.selectGoodsInfo(vo);
	}
	
	public int insertGoodsDetail(GoodsInfoVO vo) throws Exception{
		return dao.insertGoodsDetail(vo);
	}
	
	public int updateGoodsDetail(GoodsInfoVO vo) throws Exception{
		return dao.updateGoodsDetail(vo);
	}
	
	
	
}

	
	

