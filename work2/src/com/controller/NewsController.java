package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.News;
import com.services.NewsServices;

@Controller
@RequestMapping("/news")
public class NewsController {
	// 自动注入公告的services
	@Autowired
	private NewsServices newsServices;

	// 公告首页
	@RequestMapping("/newsIndex")
	public String newsIndex(Integer currPage, Model model, String lTitle) {
		if (currPage == null) {
			currPage = 1;
		}
		return newsServices.getLimitNews(currPage, model, lTitle);
	}

	// 公告新增跳转
	@RequestMapping("/getAddNews")
	public String getAddNews(Model model) {
		return newsServices.getAddNews(model);
	}

	// 新增和修改操作
	@RequestMapping("/addNews")
	public String addNews(News news, Model model) {
		return newsServices.addNews(news, model);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/getNewsByID")
	public String getNewsByID(Integer id, Model model, Integer currPage) {
		return newsServices.getNewsByID(id, model);
	}

	// 删除单个公告
	@RequestMapping("/deleteNewsByID")
	public String deleteNewsByID(Integer id, Model model) {
		newsServices.deleteNewsByID(id);
		return newsServices.getLimitNews(1, model, null);
	}

	// 公告新增跳转
	@RequestMapping("/getAllNews")
	public String getAllNews(Integer currPage, Model model, String lTitle) {
		if (currPage == null) {
			currPage = 1;
		}
		return newsServices.getAllNews(currPage, model, lTitle);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/userGetNewsById")
	public String userGetNewsById(Integer nid, Model model) {
		return newsServices.userGetNewsById(nid, model);
	}

}
