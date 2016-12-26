package com.qingke.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingke.dao.MerchantsDao;
import com.qingke.pojo.Merchants;
import com.qingke.service.MerchantsService;

@Service("merchantsService")
public class MerchantsServiceImpl implements MerchantsService{

	@Resource
	private MerchantsDao dao;
	
	public List<Merchants> selectMer(String name) {
		// TODO Auto-generated method stub
		return dao.selectMer(name);
	}

	public int changeMerStatus(int id, String status) {
		// TODO Auto-generated method stub
		return dao.changeMerStatus(id, status);
	}

}
