package com.qingke.service;

import java.util.List;

import com.qingke.pojo.Cousmer;

public interface CousmerService {

	public List<Cousmer> selectCousmer(String name);
	
	public int delCousmer(int id);
	
	public int delAdd(int id);
}
