package com.services;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.News;

public interface NewsServices {
	// 获取分页
	public String getLimitNews(int currPage, Model model, String lTitle);

	// 获取添加商品页面
	public String getAddNews(Model model);

	// 新增商品
	public String addNews(News news, Model model);

	// 通过id获取商品
	public String getNewsByID(int id, Model model);

	// 修改商品
	public String updateNews(News news, Model model, MultipartFile mypic, HttpServletRequest request);

	// 删除商品
	public String deleteNewsByID(int id);

	public String getAllNews(Model model);

	public String userGetNewsById(int nid, Model model);

	public String getAllNews(int currPage, Model model, String lTitle);

}
