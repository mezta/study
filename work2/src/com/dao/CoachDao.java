package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Coach;
import com.bean.News;

@Mapper
@Repository
public interface CoachDao {
	public List<Coach> getAllCoach(@Param("IName")String IName);
	
	//获取分页
	public List<Coach> getLimitCoach(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize,@Param("IName")String IName);
	 //新增教练
    public int addCoach(Coach coach);
    //获取教练通过id
    public Coach getCoachByID(int id);
    //修改教练
    public int updateCoach(Coach coach);
    //通过id删除
    public int deleteCoachByID(int id);
    
    public List<Coach> getAllCoachs();
}
