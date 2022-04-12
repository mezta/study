package com.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Shop;

public interface ShopService {

	public String getLimitShop(Integer currPage, Model model, String IName);

	// 新增商品
	public String addShop(Shop shop, MultipartFile mypic, Model model, HttpServletRequest request);

//    
	public String getShopByID(int shopid, Model model);

//	//修改商品
//	public String updateCoach(Coach coach,Model model,MultipartFile mypic,
//		  HttpServletRequest request);
	// 删除商品
	public String deleteShopByID(int shopid, Model model);

//	//获取添加商品页面
	public String getAddShop(Model model);

	public String getAllShop(Model model, HttpSession session);

//
	public String userGetShopById(int uid, int shopid, Model model, HttpSession session);

	public String getAllShop(Integer currPage, Model model, String IName, HttpSession session);

	public String userGetShopId(int shopid, Model model, HttpSession session);

}
