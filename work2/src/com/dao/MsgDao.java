package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Msg;

@Mapper
@Repository
public interface MsgDao {
	// 通过aid获取地址信息
	public List<Msg> getMsgNoReadByLimit(@Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize);

	public List<Msg> getListMsg(@Param("rid") Integer rid, @Param("pageNo") Integer pageNo,
			@Param("pageSize") Integer pageSize, @Param("likeTitle") String likeTitle);

	public Msg updateMsgByIddaty(@Param("mid") Integer mid, @Param("mreceiver") String mreceiver);

	public void updateMsg(@Param("mletter") String mletter, @Param("mtitle") String mtitle);

	public int addMsg(Msg msg);

	public int addMsgl(Msg msg);

	public int addMsgz(Msg msg);

	public int delMsg(Integer id);

	public int getMsgCount(@Param("rid") Integer rid, @Param("likeTitle") String likeTitle);

	public List<Msg> getAllMsgs();

	public Msg getAmsgNum(@Param("mtitle") String mtitle);

	public List<Msg> getLimitMsg(@Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize,
			@Param("mreceiver") int mreceiver, @Param("lTitle") String lTitle);

	public List<Msg> getMsgUser(@Param("uid") Integer uid, @Param("lTitle") String lTitle);

	public Msg getMsgById(@Param("mid") Integer mid);

	public List<Msg> gemsgById(@Param("mid") Integer mid);

	public void updateMsgById(Msg msg);

	public List<Msg> getAll(@Param("uid") String uid, @Param("mletter") String mletter);

	public List<Msg> getAllcourse(@Param("uid") String uid, @Param("mletter") String mletter);

	public List<Msg> getAllmsgj(@Param("uid") String uid, @Param("mletter") String mletter);

	public List<Msg> getAlls(@Param("uid") String uid);

	public List<Msg> getMsgByUid(@Param("pageNo") Integer pageNo, @Param("pageSize") Integer pageSize,
			@Param("uid") String uid);

	public List<Msg> getAmsg(int uid);

}
