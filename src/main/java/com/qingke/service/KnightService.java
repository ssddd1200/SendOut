package com.qingke.service;

import java.util.List;

import com.qingke.pojo.Knight;

public interface KnightService {

	public List<Knight> selectKnight(String name);
	
	public int changeKnightStatus(int id,String status);
}
