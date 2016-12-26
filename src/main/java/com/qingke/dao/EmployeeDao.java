package com.qingke.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qingke.pojo.Employee;

public interface EmployeeDao {
	
	public List<Employee> getAll();
	
	public Employee loginWeb(@Param(value="username")String username,@Param(value="pwd")String password);
	
	public int changeInfo(@Param(value="id")int id,@Param(value="email")String email,@Param(value="phone")String phone);
	
	public int changePassword(@Param(value="id")int id,@Param(value="newPassword")String newPassword);
	
	public void addPassword(@Param(value="id")int id,@Param(value="username")String username);
	
	public int changeManInfo(@Param(value="id")int id,@Param(value="name")String name,@Param(value="phone")String phone,@Param(value="email")String email,@Param(value="limit")String limit);
	
	public int addEmployee(@Param(value="id")int id,@Param(value="name")String name,@Param(value="phone")String phone,@Param(value="email")String email,@Param(value="limit")String limit);
	
	public int delManger(@Param(value="id")int id);
	
	public String isExit(@Param(value="id")int id);
}
