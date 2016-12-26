package com.qingke.service;

import java.util.List;

import com.qingke.pojo.Employee;

public interface EmployeeService {

	public List<Employee> getEmployee();
	
	public Employee login(String username,String password);
	
	public int changeInfo(int id,String email,String phone);
	
	public int changePassword(int id,String newPassword);
	
	public void addPassword(int id,String username);
	
	public int changeManInfo(int id,String name,String phone,String email,String limit);
	
	public int addEmployee(int id,String name,String phone,String email,String limit);
	
	public int delManger(int id);
	
	public String isExit(int id);
}
