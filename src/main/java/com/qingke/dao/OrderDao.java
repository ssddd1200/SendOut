package com.qingke.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qingke.pojo.Order;

public interface OrderDao {

	public List<Order> selectOrder(@Param(value="name")String name);
	
	public int changeOrderStatus(@Param(value="id")int id,@Param(value="status")String status);
}
