package com.qingke.Util;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Util {
	
	public static void print(HttpServletResponse response){
		try {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("<script language='javascript'>alert('ÐÞ¸ÄÊ§°Ü!!!!');window.location='/QKSendOut/personal-info.html';</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
