package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.News;
import com.bean.Type;

@Mapper
@Repository("typeDao")
public interface TypeDao {
	//获取符合条件的所有分类数目
	public List<Type> getAllType(@Param("lTname")String lTname);
	//获取分页
	public List<Type> getLimitType(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("lTname")String lTname);
	//通过商品类别名称查询所需要的数据
    public List<Type> getTypeByTname(@Param(value="tname")String tname);
    //新增分类
	public int addType(Type type);
	// 获取类别通过名称
	public Type getTypeByID(String tname);
	//获取类别	
	public List<Type> selectType();
    //获取类别通过tid
	public Type selectTypeByID(int tid);
    //修改分类
	public int updateType(Type type);
    //删除分类
	public int deleteTypeById(int tid);
	//获取类别	
	public List<Type> getAllTypes();
	
	public Type userGetTypeById(int tid);
	

}
