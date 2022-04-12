package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.News;
import com.bean.Type;

@Mapper
@Repository
public interface NewsDao {
    //获取符合条件的所有商品数目
    public List<News> getAllNews(@Param("lTitle")String lName);
    //获取分页
	public List<News> getLimitNews(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("lTitle")String lTitle);
	//获取类别
    public List<Type> getAllType();
    //新增商品
    public int addNews(News news);
    //获取商品通过id
    public News getNewsByID(int nid);
    //修改商品
    public int updateNews(News news);
    //通过id删除
    public int deleteNewsByID(int nid);
    //获取全部商品
    public List<News> AllNews();
	//通过nid获取商品消息
	public News information(int nid);
	//通过标题查询所需要的数据
	public List<News> getNewsByTitle(@Param(value="title")String title);
	
    public List<News> getAllNewsList();

}
