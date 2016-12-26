package com.qingke.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qingke.pojo.Merchants;

public interface MerchantsDao {
	
	public List<Merchants> selectMer(@Param(value="name")String name);
	
	public int changeMerStatus(@Param(value="id")int id,@Param(value="status")String status);
}
