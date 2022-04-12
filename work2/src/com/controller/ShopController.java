package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Shop;
import com.services.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;

	@RequestMapping("/shopIndex")
	public String coachIndex(Integer currPage, Model model, String IName) {

		if (currPage == null) {
			currPage = 1;
		}
		return shopService.getLimitShop(currPage, model, IName);
	}

	// 添加商品页面
	@RequestMapping("/getAddShop")
	public String getAddShop(Model model) {
		return shopService.getAddShop(model);
	}

	// 新增商品
	@RequestMapping("/addShop")
	public String addShop(Shop shop, MultipartFile mypic, Model model, HttpServletRequest request) {
		return shopService.addShop(shop, mypic, model, request);
	}

	// 通过查询单个id返回修改页面
	@RequestMapping("/getShopByID")
	public String getShopByID(Integer shopid, Model model, Integer currPage) {
		return shopService.getShopByID(shopid, model);
	}

	// 删除单个商品
	@RequestMapping("/deleteShopByID")
	public String deleteShopByID(Integer shopid, Model model) {
		shopService.deleteShopByID(shopid, model);
		return shopService.getLimitShop(1, model, null);
	}

	// 通过查询单个id返回页面
	@RequestMapping("/userGetShopById")
	public String userGetShopById(Integer uid, Integer shopid, Model model, Integer currPage, HttpSession session) {

		return shopService.userGetShopById(uid, shopid, model, session);
	}

	@RequestMapping("/userGetShopId")
	public String userGetShopId(Integer shopid, Model model, Integer currPage, HttpSession session) {
		return shopService.userGetShopId(shopid, model, session);
	}

	//
	@RequestMapping("/getAllShop")
	public String getAllShop(Integer currPage, Model model, String IName, HttpSession session) {
		if (currPage == null) {
			currPage = 1;
		}
		return shopService.getAllShop(currPage, model, IName, session);
	}

}
