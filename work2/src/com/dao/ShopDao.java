package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Shop;

@Mapper
@Repository
public interface ShopDao {
	public List<Shop> getAllShop(@Param("IName")String IName);
	
	//获取分页
	public List<Shop> getLimitShop(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("IName")String IName);
	 //新增商品
    public int addShop(Shop shop);
    //获取商品通过id
    public Shop getShopByID(int shopid);
    //修改商品
    public int updateShop(Shop shop);
    //通过id删除
    public int deleteShopByID(int shopid);
    
    public List<Shop> getAllShops();
}
