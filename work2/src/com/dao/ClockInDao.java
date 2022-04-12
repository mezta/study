package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.ClockIn;

@Mapper
@Repository
public interface ClockInDao {
	// 通过通过eid获取信息
	public List<ClockIn> getClockInListByEid(@Param("pageNo") int pageNo, @Param("pageSize") int pageSize,
			@Param("eid") int eid);

	//
	public List<ClockIn> getEmpClockInList(@Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("eid") Integer eid,@Param("pageNo") Integer page, @Param("pageSize") int pageSize);

	// 获取总数据分页用
	public List<ClockIn> getEmpClockCount(@Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("eid") Integer eid);
	
	
	public int setSignature(ClockIn clockIn);

	public ClockIn getClockInByEid(@Param("eid")int uid, @Param("cdate") String currDate);

	public List<ClockIn> getClockByUid(@Param("uid") String uid);

	public List<ClockIn> deleteClockIn(@Param("cid") int cid,@Param("uid") int uid);

	public int delClockIn(Integer cid);


}
