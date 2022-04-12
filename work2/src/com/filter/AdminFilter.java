package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.bean.Admin;

public class AdminFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		Admin admin=(Admin)session.getAttribute("admin");
		System.out.println("===admin===="+admin);
		if(admin!=null) {
		    chain.doFilter(request, response);
		}else {
			String path=req.getServletPath();
			if(path.endsWith("login.jsp") || path.endsWith("login")) {
				chain.doFilter(request, response);
			}else {
				JOptionPane.showMessageDialog(null,"登录已过期请重新登录！");
				req.getRequestDispatcher("login.jsp").
				forward(request, response);
			}
		}
	}

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

}
