package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.bean.News;

@Mapper
@Repository
public interface MessageDao {
    //获取推荐商品商品信息
	public List<News> getMainNews();
	//获取优选好物商品信息
 	public List<News> getAnews();
 	//获取最新商品信息
 	public List<News> getNewGoods();
 	//获取最热商品信息
	public List<News> getHotNews();

	

}

//public List<News> getBnews();
//public List<News> getCnews();
//public List<News> getDnews();
//public List<News> getEnews();
//public List<News> getFnews();
//public List<News> getGnews();