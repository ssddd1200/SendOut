package com.qingke.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingke.dao.OrderDao;
import com.qingke.pojo.Order;
import com.qingke.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Resource
	private OrderDao dao;
	public List<Order> selectOrder(String name) {
		// TODO Auto-generated method stub
		return dao.selectOrder(name);
	}

	public int changeOrderStatus(int id, String status) {
		// TODO Auto-generated method stub
		return dao.changeOrderStatus(id, status);
	}

}
