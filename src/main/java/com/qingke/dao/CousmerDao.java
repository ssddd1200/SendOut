package com.qingke.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.qingke.pojo.Cousmer;

public interface CousmerDao {
	
	public List<Cousmer> selectCousmer(@Param(value="name")String name);
	
	public int delCousmer(@Param(value="id")int id);
	
	public int delAdd(@Param(value="id")int id);
}
