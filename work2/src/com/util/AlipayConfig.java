package com.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000119658897";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCDMWfV83DkGM5bDO/no7DIccfNvKVy7aRXbk0LaDYmFQlhyZ4Yg7iF9EKegV9n/g1+nhI/hB4rKsndQxMDWgHmXwVJcoJbmsp7KjBJ0o1UXXYxOTYHHlTMsjaFqLG/X+/inwNexMjaTj9uMGhvvb+XZBpg6RX8AOxqvHqig4oYM1N/Vya+ER1Bwif4fupNmi9mp35I6TBlaaV5Dpgy56EVwaHx+dYlF5F8pOj6wMZ/vTpBc6/Dt1+He89OIxGsIuSOqYTjwiSkNzWfDkgx5IWL4LnUarQVmjXhNqIxwmcMHJPczKIskUcP0HCdV8RcdZP8IrWY87e7I16ftPt1aaeZAgMBAAECggEAf5HYJVxuRu60IidnVPiAG7lAD5fDzgi1CGtyMYhpNwi3scXqnG3hTShia1zj1+xbVOcCWY7wAwu9dREW+OhZ9pgpPO1DQy42fCNfBzndQc8L8ftuxOdCkDUu/TM3fB8e1V/IWCvEHzt9RHl/5EA/gEfPurKMNRr0ySlzmnmMG9DAZsHknC+kapjR9Nsiq41h70zBu9+fqXk4O16BW+jKWhoyr1cqQ1bYTp5OaL6N6XNxWHYioAk14TlvP7gpSocA7qory6yM+/hwDajnuIAGji0OkqCjt/VRYbtSQ0egP8nBk4uTBcweUtTM3bcx8SvZX2IH4TuH9M9ZZx3yVoHTnQKBgQD3bVIeo83FAn3UfLu/K+ImLD200FbhDYtfTV89ohOuvqZOH8zzSCfCs65BNbwYAyzDHE6+QunBqSRlA6D5VFXDc7tEEntkCzUniEH5MiPKt9TRJaFXV+ca6VCqvyxLrXtfUTQfU7WNDx+TMYH8kazVWkuFCY2wOO2OJOmmiULRiwKBgQCHvRaTt8MLA0IKymjUOvNHX+Hd+M8hmIAcD4epWy2wOw6Q2u3lI4NsPzB5T6yDzvp7ghIeZNk+GzY8W8a1LV36M1iua/BQH7Ntc5Hp+n7VHZoRfXacpbBmg7ASnfnTf1ZTCsw4r23UTZck+O2+eIza4j7mJlIYdabDaPkMhhmH6wKBgCcFts3eR7Wqju3UPkgIQ8KBd7nsocccu75sFXlC9pe4ucHYghpcZujuLa1bLC8dURH0hPa81uEULAlCaUDpbB1HQ2GZCJzep6N0efMzVTHDjGzv4mJEGs7DvVUwkWveEHcX94B5U0jL+c7dIAMVdoyvkPmKaC5CzDR+3drGCyPBAoGAGWYZXmSpO1tNtUUwnl21feqEEgvnfirR9e41/UuRXgN+8z3z+8dMZSnhwSFWb4eAOTIaf9NxDvz6hgrKQMaPaizHcEPEQMndwiI48GYt62TRmmo2kpMyUcxcWu9yes+98GX51rWEwJAQMxvdKKHYAXEKQfhzrh39qVzwFRbWmicCgYBJoYXlsUKv0phgl/ANMUoUKd6onzqhswLACkEj3bSQuTKWtKxbcat/W5XX5cU5clHhBBkmagdxUMvb8TVFOoPCG9e2QNbcKeXMla7mjpiPJE/y6mskvHF8eByMOp8EuvL0zx1hP8JZluTuaIN4soWvDA0j1GNz2iKBXr6O4dWEgA==";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhLvRzUxWnY7iWZzTNxOkDtEBwIrRiOn/G1PE+Cu6e+zOn/qUjiIaO6/db23DkQW41fMjScVp1L+FrXUURtaBp7APTb6nwzEfg/u2JHjmSyeAbDH2EyTpa7gOyhje8c4LIMTe1vPpnroqae1RMEGkhJRhMRbalnVp2P0xsooZJFSi4X6KlKAseJuBlMRF/foODR/HqDr1J3b79aCpXDtLy9Ka6qTEOrpRQJj1rgFnOqCKcYA/LDc0bjxD0OXcHHdRGjIUrcwL0/SMRDhe+BZUoM6/H7AXunnxdS3kMKPFsParCs4/HAm8cZ1q3hR5Gwvl19DHgB+yUyd/ux/DgHnvuwIDAQAB";

	// 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/work2/empMsg/returnUrl";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "C:\\";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * 
	 * @param sWord 要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
