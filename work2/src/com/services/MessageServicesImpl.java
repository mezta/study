package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bean.News;
import com.dao.MessageDao;

@Service("MessageSerivces")
public class MessageServicesImpl implements MessageServices{
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public String getMainNews(Model model){
		
		List<News> mainNews = messageDao.getMainNews();
		
		model.addAttribute("mainNews", mainNews);
		
		return "user/main";
	}
	@Override
	public String getAnews(Model model){
		
		List<News> Anews = messageDao.getAnews();
		
		model.addAttribute("Anews", Anews);
		
		return "user/main";
	}
	
	@Override
	public String getNewGoods(Model model){
		
		List<News> newGoods = messageDao.getNewGoods();
		
		model.addAttribute("newGoods", newGoods);
		
		return "user/goods";
	}
	
	@Override
	public String getHotNews(Model model){
		
		List<News> hotNews = messageDao.getHotNews();
		
		model.addAttribute("hotNews", hotNews);
		
		return "user/hotgoods";
	}

}
