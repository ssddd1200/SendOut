package com.qingke.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qingke.Util.Util;
import com.qingke.pojo.Cousmer;
import com.qingke.pojo.Employee;
import com.qingke.pojo.Knight;
import com.qingke.pojo.Merchants;
import com.qingke.pojo.Order;
import com.qingke.service.CousmerService;
import com.qingke.service.EmployeeService;
import com.qingke.service.KnightService;
import com.qingke.service.MerchantsService;
import com.qingke.service.OrderService;

@Controller
@RequestMapping("/")
public class EmployeeController {
	
	@Resource
	private EmployeeService employeeService;
	
	@Resource
	private MerchantsService merchantsService;
	
	@Resource
	private KnightService knightService;
	
	@Resource
	private CousmerService cousmerService;
	
	@Resource
	private OrderService orderService;
	
	@RequestMapping("/list")
	public String getAl(HttpServletRequest request,HttpServletResponse response){
		
		request.setAttribute("employee", employeeService.getEmployee());
		
		return "employee.jsp";
		
	}
	
	@RequestMapping(value="/loginWeb",method=RequestMethod.GET)
	public String login(HttpServletRequest request,HttpServletResponse response){
		
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		Employee employee = employeeService.login(username, password);
		System.out.println(employee);
		if(employee != null){
			HttpSession session = request.getSession();
			session.setAttribute("object", employee);
			session.setAttribute("id", employee.getId());
			session.setAttribute("name", employee.getName());
			session.setAttribute("password", password);
			session.setAttribute("limit", employee.getStatus());
			
			return "index.html";
		}
		return "login.html";
	}
	
	@RequestMapping(value="/loadWeb",method=RequestMethod.GET)
	public void loadWeb(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String name=(String)request.getSession().getAttribute("name");
		
		out.write(name);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/changeInfo",method=RequestMethod.GET)
	public String changeInfo(HttpServletRequest request,HttpServletResponse response){
		System.out.println(request.getSession().getAttribute("id"));
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int id = Integer.valueOf( request.getSession().getAttribute("id").toString());
		
		int result = employeeService.changeInfo(id, email, phone);
		if(result>0){
			//Util.print(response);
			return "personal-info.html";
		}else{
			return "<script language='javascript'>alert('µÇÂ¼Ê§°Ü!!!!');history.back();</script>";			
		}
	}
	
	@RequestMapping(value="/changePwd",method=RequestMethod.GET)
	public String changePwd(HttpServletRequest request,HttpServletResponse resqonse){
		String oldPwd = request.getParameter("oldPwd");
		String newPwd1 = request.getParameter("newPwd");
		String newPed2 = request.getParameter("curPwd");
		int id = Integer.valueOf(request.getSession().getAttribute("id").toString());

		if(newPwd1.equals(newPed2) && oldPwd.equals(request.getSession().getAttribute("password"))){
			int result = employeeService.changePassword(id, newPwd1);
			if(result>0){
				return "password.html";
			}
		}
		
		return "<script language='javascript'>alert('µÇÂ¼Ê§°Ü!!!!');history.back();</script>";
	}
	
	@RequestMapping(value="/getEmployee",method=RequestMethod.GET)
	public String getAllEmployee(HttpServletRequest request,HttpServletResponse response){
		
		List<Employee> employeeList = employeeService.getEmployee();
		
		HttpSession session = request.getSession();
		session.setAttribute("employee", employeeList);
		return "employee.jsp";
	}
	
	@RequestMapping(value="/changeEmployeeInfo",method=RequestMethod.GET)
	public String changeEmployee(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.valueOf((String)request.getParameter("id"));
		String name = request.getParameter("ename");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String limit = request.getParameter("limit");
		if("Y".equals(employeeService.isExit(id))){
			employeeService.changeManInfo(id, name, phone, email, limit);
		}else{
			employeeService.addEmployee(id, name, phone, email, limit);
			String username = String.format("%03d", id);
			employeeService.addPassword(id, username);
		}
		return "employee.jsp";
	}
	
	@RequestMapping(value="/delEmployee",method=RequestMethod.GET)
	public String delEmployee(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.valueOf(request.getParameter("id"));
		int result = employeeService.delManger(id);
		
		return "/getEmployee";
	}
	
	@RequestMapping(value="/getMerchants",method=RequestMethod.GET)
	public String getMerchants(HttpServletRequest request,HttpServletResponse response){
		String name = request.getParameter("name");
		List<Merchants> merList = merchantsService.selectMer(name);
		HttpSession session = request.getSession();
		session.setAttribute("merchants", merList);
		return "shops.jsp";
	}
	
	@RequestMapping(value="/changeStatus",method=RequestMethod.GET)
	public String changeStatus(HttpServletRequest request,HttpServletResponse response){
		
		int id = Integer.valueOf(request.getParameter("id"));
		String status = request.getParameter("st");
		int result = merchantsService.changeMerStatus(id, status);
		System.out.println("result = "+result);
		if(result>0){
			return "/getMerchants";			
		}
		return null;
	}
	
	@RequestMapping(value="/getKnight",method=RequestMethod.GET)
	public String getKnight(HttpServletRequest request,HttpServletResponse response){
		
		String name = request.getParameter("name");
		
		List<Knight> nightList = knightService.selectKnight(name);
		request.getSession().setAttribute("knight", nightList);
		
		return "riders.jsp";
	}
	
	@RequestMapping(value="/changeKnightStatus",method=RequestMethod.GET)
	public String changeKnightStatus(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.valueOf(request.getParameter("id"));
		String status = request.getParameter("st");
		int result = knightService.changeKnightStatus(id, status);
		return "/getKnight";
	}
	
	@RequestMapping(value="/getCousmer",method=RequestMethod.GET)
	public String getCousmer(HttpServletRequest request,HttpServletResponse response){
		
		String name = request.getParameter("name");
		List<Cousmer> cousmerList = cousmerService.selectCousmer(name);
		request.getSession().setAttribute("cousmer", cousmerList);
		System.out.println(cousmerList);
		return "users.jsp";
	}
	
	@RequestMapping(value="/delCousmer",method=RequestMethod.GET)
	public String delCousmer(HttpServletRequest request,HttpServletResponse response){
		
		int id = Integer.valueOf(request.getParameter("id"));
		int result = cousmerService.delCousmer(id);
		if(result>0){
			int a = cousmerService.delAdd(id);
			if(a>0){
				return "/getCousmer";				
			}
		}
		return null;
	}
	
	@RequestMapping(value="/getOrder",method=RequestMethod.GET)
	public String getOrder(HttpServletRequest request,HttpServletResponse response){
		
		String name = request.getParameter("name");
		List<Order> orderList = orderService.selectOrder(name);
		request.getSession().setAttribute("order", orderList);
		return "orders.jsp";
	}
	
	@RequestMapping(value="/changeOrderStatus",method=RequestMethod.POST)
	public void changeOrderStatus(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		int id = Integer.valueOf(request.getParameter("id"));
		String status = request.getParameter("st");
		int result = orderService.changeOrderStatus(id, status);
		System.out.println("result ="+result);
		response.setCharacterEncoding("utf-8");
		response.getWriter().println(result);
	}
	
	
}