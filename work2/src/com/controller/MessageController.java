package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.services.MessageServices;

@Controller
@RequestMapping("/user")
public class MessageController {
	// 自动注入商品的services
	@Autowired
	private MessageServices messageServices;

	// 购物网首页
	@RequestMapping("/getMainNews")
	public String getMainNews(Model model) {

		System.err.println("-------1111--------" + messageServices.getMainNews(model));
		return messageServices.getMainNews(model);
	}

	@RequestMapping("/getAnews")
	public String getAnews(Model model) {

		System.err.println("-------1111--------" + messageServices.getAnews(model));
		return messageServices.getAnews(model);
	}

	@RequestMapping("/getNewGoods")
	public String getNewGoods(Model model) {

		System.err.println("-------1111--------" + messageServices.getNewGoods(model));
		return messageServices.getNewGoods(model);
	}

	@RequestMapping("/getHotNews")
	public String getHotNews(Model model) {
		System.err.println("-------1111--------" + messageServices.getHotNews(model));
		return messageServices.getHotNews(model);
	}

	/*
	 * @RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
	 * 
	 * @ResponseBody public String goAlipay(String orderNum, HttpServletRequest
	 * request, HttpServletRequest response) throws Exception {
	 * 
	 * Orders order = orderService.getOrderItemByOrderNum(orderNum);
	 * 
	 * // 获得初始化的AlipayClient AlipayClient alipayClient = new
	 * DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
	 * AlipayConfig.merchant_private_key, "json", AlipayConfig.charset,
	 * AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	 * 
	 * // 设置请求参数 AlipayTradePagePayRequest alipayRequest = new
	 * AlipayTradePagePayRequest();
	 * alipayRequest.setReturnUrl(AlipayConfig.return_url);
	 * alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	 * 
	 * // 商户订单号，商户网站订单系统中唯一订单号，必填 String out_trade_no = order.getOrderNum(); //
	 * 付款金额，必填 String total_amount = order.getTotale() + ""; // 订单名称，必填
	 * StringBuilder goodsNames = new StringBuilder(); for (OrderItem oi :
	 * order.getOrderItems()) { goodsNames.append(oi.getOiGoodsName()); } String
	 * subject = goodsNames.toString(); // 商品描述，可空 String body = "用户订购商品个数：" +
	 * order.getRecvRemark();
	 * 
	 * // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，
	 * 都在0点关闭）。该参数数值不接受小数点， // 如 1.5h，可转换为 90m。 String timeout_express = "1c";
	 * 
	 * alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," +
	 * "\"total_amount\":\"" + total_amount + "\"," + "\"subject\":\"" + subject +
	 * "\"," + "\"body\":\"" + body + "\"," + "\"timeout_express\":\"" +
	 * timeout_express + "\"," + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	 * 
	 * // 请求 String result = alipayClient.pageExecute(alipayRequest).getBody();
	 * return result; }
	 */

}
