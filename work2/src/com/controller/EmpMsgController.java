package com.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bean.Msg;
import com.services.EmpMsgServices;
import com.util.AlipayConfig;

@Controller
@RequestMapping("/empMsg")
public class EmpMsgController {
	@Autowired
	private EmpMsgServices empMsgServices;

	@RequestMapping("/empMsgManage")
	public String empMsgManage(Model model, HttpSession session, Integer pageNo, String likeTitle) {
		if (pageNo == null || pageNo == 0) {
			pageNo = 1;
		}
		return empMsgServices.getListByLimit(model, 0, pageNo, 3, likeTitle);
	}

	// 跳转订单添加页面
	@RequestMapping("msgAddView")
	public String msgAddPage(Model model, Integer id) {
		return empMsgServices.addMsgView(model, id);
	}

	// 发送订单信息操作
	@RequestMapping("/empMsgAdd")
	public String empMsgAdd(Msg msg, Model model, HttpSession session) {
		return empMsgServices.addMsg(model, msg, session);
	}

//	// 发送订单信息操作
//	@RequestMapping("/empMsgtoAdd")
//	public String empMsgtoAdd(Msg msg, Model model, HttpSession session) {
//		String orderNum = empMsgServices.toaddMsg(model, msg, session);
//		model.addAttribute("orderNum", orderNum);
//		return "redirect:buy";
//	}

	// 管理端删除订单
	@RequestMapping("/empMsgDel")
	public String empMsgDel(Integer id, Model model, HttpSession session) {
		return empMsgServices.delMsg(model, id);
	}

	// 用户端删除订单
	@RequestMapping("/deleteMsgByID")
	public String deleteMsgByID(Integer mid, Integer uid) {
		return empMsgServices.deleteMsgByID(mid, uid);
	}

//	@RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
//	  public String goAlipay(String mimtle, HttpServletRequest request, HttpServletRequest response) throws Exception {
//	  
//	  Msg order = empMsgServices.getAmsgNum(mimtle);
//	  
//	  // 获得初始化的AlipayClient AlipayClient alipayClient = new
//	  DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
//	  AlipayConfig.merchant_private_key, "json", AlipayConfig.charset,
//	  AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
//	  
//	 // 设置请求参数 AlipayTradePagePayRequest alipayRequest = new
//	  AlipayTradePagePayRequest();
//	  alipayRequest.setReturnUrl(AlipayConfig.return_url);
//	  alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
//	  
//	  // 商户订单号，商户网站订单系统中唯一订单号，必填 String out_trade_no = order.getMtitle(); //
//	  付款金额，必填 String total_amount = order.getMprize() + ""; // 订单名称，必填
//	  
//	  StringBuilder goodsNames = new StringBuilder(); for (OrderItem oi :
//	  order.getOrderItems()) { goodsNames.append(oi.getOiGoodsName()); } String
//	  subject = goodsNames.toString();
//	 
//	  int subject = order.getMid(); // 商品描述，可空 String body = "用户订购商品个数：" +
//	  order.getMletter();
//	  
//	  // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，
//	  都在0点关闭）。该参数数值不接受小数点， // 如 1.5h，可转换为 90m。 String timeout_express = "1c";
//	  
//	  alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," +
//	  "\"total_amount\":\"" + total_amount + "\"," + "\"subject\":\"" + subject +
//	  "\"," + "\"body\":\"" + body + "\"," + "\"timeout_express\":\"" +
//	  timeout_express + "\"," + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
//	  
//	  // 请求 String result = alipayClient.pageExecute(alipayRequest).getBody();
//	  return result;
//	  
//	}
	@RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String goAlipay(String mtitle, HttpServletRequest request, HttpServletRequest response) throws Exception {
		System.err.println(mtitle);
		Msg order = empMsgServices.getAmsgNum(mtitle);
		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);

		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = order.getMtitle();
		// 付款金额，必填
		String total_amount = order.getMprize() + "";
		// 订单名称，必填
		// StringBuilder goodsNames = new StringBuilder();
//		for (OrderItem oi : order.getOrderItems()) {
//			goodsNames.append(oi.getOiGoodsName());
//		}String subject = goodsNames.toString();
		int subject = order.getMid();

		// 商品描述，可空
		String body = "会员套餐 ";

		// 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。该参数数值不接受小数点，
		// 如 1.5h，可转换为 90m。
		String timeout_express = "1c";
		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		// 请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		return result;
	}

	/**
	 * 同步跳转
	 *
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/returnUrl")
	public String returnUrl(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		// 获取支付宝GET过来反馈信息（官方固定代码）
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			params.put(name, valueStr);
		}
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名

		// 返回界面
		if (signVerified) {
			System.out.println("前往支付成功页面");
			String out = request.getParameter("out_trade_no");
			String mletter = "支付成功";
			return empMsgServices.updateMsg(out, mletter);
		} else {
			System.out.println("前往支付失败页面");
			mav.setViewName("failReturn");
		}
		return null;
	}

}
