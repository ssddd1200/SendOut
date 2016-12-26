package com.qingke.service;

import java.util.List;

import com.qingke.pojo.Order;

public interface OrderService {

	public List<Order> selectOrder(String name);
	
	public int changeOrderStatus(int id,String status);
}
