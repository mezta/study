package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.bean.User;

@WebFilter("/UserFilter")
public class UserFilter implements Filter {

	public void doFilter(ServletRequest request, 
			ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		System.out.println("===user===="+user);
		if(user!=null) {
		    chain.doFilter(request, response);
		}else {
			String path=req.getServletPath();
			if(path.endsWith("login.jsp") || path.endsWith("login")) {
				chain.doFilter(request, response);
			}else {
				JOptionPane.showMessageDialog(null,"账号密码错误");
				req.getRequestDispatcher("login.jsp").
				forward(request, response);
			}
		}
	}

	public void destroy() {
		
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
