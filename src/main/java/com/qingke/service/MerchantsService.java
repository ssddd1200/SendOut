package com.qingke.service;

import java.util.List;

import com.qingke.pojo.Merchants;

public interface MerchantsService {

	public List<Merchants> selectMer(String name);
	
	public int changeMerStatus(int id,String status);
}
