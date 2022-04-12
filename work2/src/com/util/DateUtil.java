package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


public class DateUtil {
	public static String getNowFormatDate(String format) {
		String returnVal="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		returnVal=sdf.format(new Date());
		return returnVal;
	}
	
	public String getNowFormatDate(String format,Date date) {
		String returnVal="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		returnVal=sdf.format(date);
		return returnVal;
	}
	
	public Date getNowFormatDate(String fromat,String source) {
		SimpleDateFormat sdf=new SimpleDateFormat(fromat);
		Date returnDate = new Date();
		try {
			returnDate = sdf.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnDate;
	}
	public static List<Date> findDates(Date dBegin, Date dEnd)
	    {
	     List lDate = new ArrayList();
	     lDate.add(dBegin);
	     Calendar calBegin = Calendar.getInstance();
	     // 使用给定的 Date 设置此 Calendar 的时间
	     calBegin.setTime(dBegin);
	     Calendar calEnd = Calendar.getInstance();
	     // 使用给定的 Date 设置此 Calendar 的时间
	     calEnd.setTime(dEnd);
	     // 测试此日期是否在指定日期之后
	     while (dEnd.after(calBegin.getTime()))
	     {
	      // 根据日历的规则，为给定的日历字段添加或减去指定的时间量
	      calBegin.add(Calendar.DAY_OF_MONTH, 1);
	      lDate.add(calBegin.getTime());
	     }
	     return lDate;
	}
	 
//	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	Date begin = sdf.parse(request.getParameter("mbegin"));
//	Date end = sdf.parse(request.getParameter("mend"));
//	List<Date> lDate = findDates(begin, end);
}


