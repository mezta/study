package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtil {
	public static String getNowFormatDate(String format) {
		String returnVal = "";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		returnVal = sdf.format(new Date());
		return returnVal;
	}

	public String getNowFormatDate(String format, Date date) {
		String returnVal = "";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		returnVal = sdf.format(date);
		return returnVal;
	}

	public Date getNowFormatDate(String fromat, String source) {
		SimpleDateFormat sdf = new SimpleDateFormat(fromat);
		Date returnDate = new Date();
		try {
			returnDate = sdf.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnDate;
	}

	public static List<Date> findDates(Date dBegin, Date dEnd) {
		List lDate = new ArrayList();
		lDate.add(dBegin);
		Calendar calBegin = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		calEnd.setTime(dEnd);
		// 测试此日期是否在指定日期之后
		while (dEnd.after(calBegin.getTime())) {
			// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
			calBegin.add(Calendar.DAY_OF_MONTH, 1);
			lDate.add(calBegin.getTime());
		}
		return lDate;

	}

	public static String findDate(String dEnd) {

		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currdate = format.format(d);
		// System.out.println("现在的日期是：" + currdate);
		Calendar ca = Calendar.getInstance();
		ca.setTime(d);
		ca.add(Calendar.DATE, Integer.parseInt(dEnd));// num为增加的天数，可以改变的
		d = ca.getTime();
		String enddate = format.format(d);
		System.out.println("增加天数以后的日期：" + enddate);

		return enddate;

	}

	public static String Dates(String dEnd) {
		/*
		 * 计算两个时间间隔
		 */
		try {
			Date date = new Date();// 创建Date类型对象
			// 创建SimpleDateFormat类型对象、 "yyyy-MM-dd HH:ss:mm.SSS"是正则式，分别表示年月日时分秒毫秒
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
			// 定义两个时间
			String startTime = df.format(date);

			String endTime = dEnd;
			// 将两个String类型的时间转换为Date类型，从而计算差值、parse()方法的作用是将String类型的时间解析为Date类型
			// System.out.println((((d2.getTime() - d1.getTime()) / (60 * 60 * 1000)) % 24)
			// + "小时");
			Date d1 = df.parse(startTime);
			System.err.println("现在时间" + d1);
			Date d2 = df.parse(endTime);
			System.err.println("到期时间" + d2);
			int surplus = (int) ((d2.getTime() - d1.getTime()) / (24 * 60 * 60 * 1000));
			int surplu = (int) (((d2.getTime() - d1.getTime()) / (60 * 60 * 1000)) % 24);
			System.err.println("相减后的时间" + surplus);

			if (surplu > 0) {
				String surplus1 = surplus + "天";
				String surplus2 = surplu + "小时";
				String surplus3 = surplus1 + surplus2;
				return surplus3;
			} else {
				String surplus2 = "已到期";
				return surplus2;
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dEnd;

	}

	public static String Date(String dEnd) {
		/*
		 * 计算两个时间间隔
		 */
		try {
			Date date = new Date();// 创建Date类型对象
			// 创建SimpleDateFormat类型对象、 "yyyy-MM-dd HH:ss:mm.SSS"是正则式，分别表示年月日时分秒毫秒
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm");
			// 定义两个时间
			String startTime = df.format(date);

			String endTime = dEnd;
			// 将两个String类型的时间转换为Date类型，从而计算差值、parse()方法的作用是将String类型的时间解析为Date类型
			// System.out.println((((d2.getTime() - d1.getTime()) / (60 * 60 * 1000)) % 24)
			// + "小时");
			Date d1 = df.parse(startTime);
			System.err.println("现在时间" + d1);
			Date d2 = df.parse(endTime);
			System.err.println("到期时间" + d2);
			int surplus = (int) ((d2.getTime() - d1.getTime()) / (24 * 60 * 60 * 1000));
			System.err.println("相减后的时间" + surplus);
			String surplus1 = surplus + "";
			return surplus1;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dEnd;

	}

}
//System.err.println(surplus);
// long aInteger= (d2.getTime() - d1.getTime()) / (24 * 60 * 60 * 1000) ;
// System.out.println((((d2.getTime() - d1.getTime()) / (24 * 60 * 60 * 1000)))
// / 365 + "年");
// System.out.println((d2.getTime() - d1.getTime()) / (24 * 60 * 60 * 1000) +
// "天");
// System.out.println((((d2.getTime() - d1.getTime()) / (60 * 60 * 1000)) % 24)
// + "小时");
// System.out.println((((d2.getTime() - d1.getTime()) / 1000) % 60) + "分钟");
// System.out.println(((d2.getTime() - d1.getTime()) / (60 * 1000)) % 60 + "秒");
// System.out.println((((d2.getTime() - d1.getTime())) % 1000) + "毫秒");