package com.shop.goods.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;


import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.SupplierInfoVo;

@MapperScan(basePackages="com.shop.goods.dao")
public interface GoodsDao {

	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO vo) throws Exception;
		
	public List<SupplierInfoVo> selectSupplier(SupplierInfoVo vo) throws Exception;
	
	public List<GoodsInfoVO> selectGoodsInfoList(GoodsInfoVO vo) throws Exception;

	public GoodsInfoVO selectGoodsInfo(GoodsInfoVO vo) throws Exception;
	
	public int insertGoodsDetail(GoodsInfoVO vo) throws Exception;
	
	public int updateGoodsDetail(GoodsInfoVO vo) throws Exception;
	
	
}
