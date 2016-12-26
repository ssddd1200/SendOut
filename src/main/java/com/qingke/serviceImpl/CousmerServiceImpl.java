package com.qingke.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingke.dao.CousmerDao;
import com.qingke.pojo.Cousmer;
import com.qingke.service.CousmerService;

@Service("cousmerService")
public class CousmerServiceImpl implements CousmerService{

	@Resource
	private CousmerDao dao;
	
	public List<Cousmer> selectCousmer(String name) {
		// TODO Auto-generated method stub
		return dao.selectCousmer(name);
	}

	public int delCousmer(int id) {
		// TODO Auto-generated method stub
		return dao.delCousmer(id);
	}

	public int delAdd(int id) {
		// TODO Auto-generated method stub
		return dao.delAdd(id);
	}

}
