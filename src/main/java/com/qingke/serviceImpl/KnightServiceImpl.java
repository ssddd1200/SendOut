package com.qingke.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingke.dao.KnightDao;
import com.qingke.pojo.Knight;
import com.qingke.service.KnightService;

@Service("knightService")
public class KnightServiceImpl implements KnightService{

	@Resource
	private KnightDao dao;
	
	public List<Knight> selectKnight(String name) {
		// TODO Auto-generated method stub
		return dao.selectKnight(name);
	}

	public int changeKnightStatus(int id, String status) {
		// TODO Auto-generated method stub
		return dao.changeKnightStatus(id, status);
	}

}
