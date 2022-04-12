package com.util;


import java.util.HashMap;
import java.util.Map;


public class LimitPageUtil {
	public Map<String, Integer> getBeginRecordAndPageSize(Integer countRecord,int currentPage,int pageSize){
		Map<String, Integer> resultMap=(Map<String, Integer>) new HashMap();
		int begin=(currentPage-1)*pageSize;//当前页码减去1乘页数就是第几页
		int countPage=countRecord % pageSize>0?countRecord/pageSize+1:countRecord/pageSize;
		resultMap.put("beginRecord", begin);
		resultMap.put("pageSize", pageSize);
		resultMap.put("countPage", countPage);
		return resultMap;
	};
}
