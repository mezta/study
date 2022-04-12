package com.services;

import org.springframework.ui.Model;

public interface MessageServices {
    //获取推荐商品
	public String getMainNews(Model model);
	//获取优选好物
 	public String getAnews(Model model);
 	//获取最新商品
 	public String getNewGoods(Model model);
 	//获取最热商品
	public String getHotNews(Model model);
 	
 	
 	
 	}
//	public String getBnews(Model model);
//	public String getCnews(Model model);
//	public String getDnews(Model model);
//	public String getEnews(Model model);
//	public String getFnews(Model model);
//	public String getGnews(Model model);
	
