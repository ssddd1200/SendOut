package com.qingke.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qingke.pojo.Knight;

public interface KnightDao {

	public List<Knight> selectKnight(@Param(value="name")String name);
	
	public int changeKnightStatus(@Param(value="id")int id,@Param(value="status")String status);
}
