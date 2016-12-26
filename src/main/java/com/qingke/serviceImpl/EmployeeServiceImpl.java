package com.qingke.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qingke.dao.EmployeeDao;
import com.qingke.pojo.Employee;
import com.qingke.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{

	@Resource
	public EmployeeDao dao;
	
	public List<Employee> getEmployee() {
		
		return dao.getAll();
	}
	public Employee login(String username, String password) {
		
		return dao.loginWeb(username,password);
	
	}
	public int changeInfo(int id, String email, String phone) {
		// TODO Auto-generated method stub
		return dao.changeInfo(id, email, phone);
	}
	public int changePassword(int id, String newPassword) {
		// TODO Auto-generated method stub
		return dao.changePassword(id, newPassword);
	}
	public void addPassword(int id, String username) {
		// TODO Auto-generated method stub
		dao.addPassword(id, username);
	}
	public int changeManInfo(int id, String name, String phone, String email, String limit) {
		// TODO Auto-generated method stub
		return dao.changeManInfo(id, name, phone, email, limit);
	}
	public int addEmployee(int id, String name, String phone, String email, String limit) {
		// TODO Auto-generated method stub
		return dao.addEmployee(id, name, phone, email, limit);
	}
	public int delManger(int id) {
		// TODO Auto-generated method stub
		return dao.delManger(id);
	}
	public String isExit(int id) {
		// TODO Auto-generated method stub
		return dao.isExit(id);
	}

}
