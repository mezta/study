<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style>
.am-btn-toolbar {
	margin-left: 50px;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../css/admin/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin/admin.css" />
</head>

<body class="gray-bg">

	
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">订单信息管理</strong> <small></small>
			</div>
		</div>

		<hr>

		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
				</div>
			</div>
			<div class="am-u-sm-12 am-u-md-3"></div>
			<%-- <div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
					<input type="text" class="am-form-field" id="searchData"
						value="${likeTitle}"> <span class="am-input-group-btn">
						<button class="am-btn am-btn-default" type="button" id="search">搜索</button>
					</span>
				</div>
			</div> --%>
		</div>
		<div class="am-g">
			<div class="am-u-sm-12">
				<form class="am-form">
					<table class="am-table am-table-striped am-table-hover table-main">
						<thead>
							<tr>
								<th class="table-id" style="width: 10%; text-align: center">ID</th>
									<th class="table-title" style="width: 10%; text-align: center">订单号</th>
								<th class="table-title" style="width: 20%; text-align: center">下单时间</th>
								<th class="table-type" style="width: 10%; text-align: center">订单金额</th>
								<th class="table-author am-hide-sm-only" style="width: 10%; text-align: center">订单积分</th>
								<th class="table-author am-hide-sm-only"
									style="width: 10%; text-align: center">商品id</th>
									<th class="table-title" style="width: 10%; text-align: center">用户编号</th>
								<th class="table-set" style="width: 10%; text-align: left">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${msgList}" var="msg" varStatus="vs">
								<a href="../empMsg/msgAddView?id=${msg.mid}">
									<tr>
										<td style="width: 10%; text-align: center"><a href="#">${msg.mid}</td>
										<td style="width: 10%; text-align: center"><a href="#">${msg.mtitle}</td>
										<td style="width: 20%; text-align: center"><a href="#">${msg.msendtime}</a>
										</td>
										<td style="width: 10%; text-align: center"><a href="#">${msg.mprize}</a>
										</td>
											<td class="am-hide-sm-only"
											style="width: 10%; text-align: center"><a href="#">${msg.mcount}</td>
										<td class="am-hide-sm-only"
											style="width: 10%; text-align: center"><a href="#">${msg.mcontent}</td>
											<td style="width: 15%; text-align: center"><a href="#">${msg.uid}</a>
										
										<td style="width: 20%; text-align: center; ">
											<div class="am-btn-toolbar"
												style="text-align: center;">
												<a
													href="<%=request.getContextPath()%>/empMsg/empMsgDel?id=${msg.mid}">
													<div class="am-btn-group am-btn-group-xs"
														style="text-align: center">
														<button
															class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
															<span class="am-icon-trash-o" style="text-align: center"></span>
															<a
																href="<%=request.getContextPath()%>/empMsg/empMsgDel?id=${msg.mid}" onclick="return confirm('确实要删除该订单吗?')">删除</a>
														</button>
													</div>
												</a>
											</div>
										</td>
									</tr>
								</a>
							</c:forEach>
						</tbody>
					</table>
						<div class="am-cf pager">
						
						<div class="am-fr pager-items">
						
						
						
							<ul class="am-pagination">
								<!-- <li><a href="javascript:void(0)" onclick="goNewPage(1)">«</a>
								</li> -->
								<li>
									<a href="javascript:void(0)"
									onclick="goNewPage(${currentPage - 1})">上一页</a>
								</li>
								<c:forEach var="i" begin="1" end="${countPage}" step="1">
									<li id="page_${i}"><a href="javascript:void(0)"
										onclick="goNewPage(${i})">${i}</a></li>
								</c:forEach>
								<li>
									<a href="javascript:void(0)"
									onclick="goNewPage(${currentPage + 1})">下一页</a>
								</li>
								<%-- <li><a href="javascript:void(0)"
									onclick="goNewPage(${countPage})">»</a></li> --%>
							</ul>
							
							
							
							<div class="count">共${count}条记录</div>
						</div>
					</div>
					<hr>
					<!-- 信息提示 -->
					<input value="${mess}" type="hidden" id="message">
				</form>
			</div>
		</div>
	</div>
</body>
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script >
var currentPage=${currentPage};
var totalPagerNumber = ${countPage};
console.log(totalPagerNumber)
$("#page_"+currentPage).addClass("am-active");
$("#search").click(function(){
	var data=$(".am-form-field").val();
	var url="../empMsg/empMsgManage?pageNo=1&likeTitle=" + data;
	window.location.href=url;
});
function goNewPage(pageNum){
	if(pageNum <= 0) {
		// alert("最后一页");
		return null;
	}
	if(pageNum > totalPagerNumber) {
		alert("最后一页");
		return null;
	}
	var data='${likeTitles}';
	window.location.href="../empMsg/empMsgManage?pageNo=" + pageNum + "&likeTitle=" + data;
}
var message=document.getElementById("message").value;
if(message!=null&&message!=""){
	alert(message);
}
</script>
</html>