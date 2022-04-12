<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
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

<body>
	
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">商品管理</strong><small></small>
			</div>
		</div>

		<hr>

		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<span><a href="../shop/getAddShop"><button type="button"
								class="am-btn am-btn-default">
								<span class="am-icon-plus">新增
							</button></a>
					</div>
				</div>
			</div>
			<div class="am-u-sm-12 am-u-md-3"></div>
			<div class="am-u-sm-12 am-u-md-3">
				<div class="am-input-group am-input-group-sm">
					<input type="text" class="am-form-field" id="searchData"
						value="${IName}"> <span class="am-input-group-btn">
						<button class="am-btn am-btn-default" type="button" id="search">查询商品</button>
					</span>
				</div>
			</div>
		</div>
		<div class="am-g">
			<div class="am-u-sm-12">
				<form class="am-form">
					<table class="am-table am-table-striped am-table-hover table-main">
						<thead>
							<tr>
								<th class="table-id" style="width: 5%; text-align: center">ID</th>
								<th class="table-title" style="width: 10%; text-align: center">商品名称</th>
								<th class="table-type" style="width: 10%; text-align: center">商品描述</th>
								<th class="table-type" style="width: 10%; text-align: center">商品价格</th>
								<th class="table-type" style="width: 10%; text-align: center">商品积分</th>
								<th class="table-author am-hide-sm-only"
									style="width: 15%; text-align: center">商品图片</th>
								<th class="table-set" style="width: 20%; text-align: center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopList}" var="val" varStatus="vs">
								<tr>
									<td style="width: 5%; text-align: center">${val.shopid}</td>
									<td style="width: 10%; text-align: center">${val.shopname}</td>
									<td class="am-hide-sm-only"
										style="width: 10%; text-align: center">${val.content}</td>
									<td class="am-hide-sm-only"
										style="width: 10%; text-align: center">${val.price}</td>
										<td class="am-hide-sm-only"
										style="width: 10%; text-align: center">${val.letter}</td>
									<td class="am-hide-sm-only"
										style="width: 15%; text-align: center"><img style="width:120px;height:90px;" src="${basePath}${val.pic}"/></td>
									<td style="width: 20%; text-align: center;">
										<div class="am-btn-toolbar"
											style="text-align: center; margin-left: 60px">
											<div class="am-btn-group am-btn-group-xs"
												style="text-align: center">
												<button
													class="am-btn am-btn-default am-btn-xs am-text-secondary">
													<span class="am-icon-pencil-square-o"
														style="text-align: center"></span> <a
														href="../shop/getShopByID?shopid=${val.shopid}&&currPage=1">修改商品</a>
												</button>
												<button
													class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
													<span class="am-icon-trash-o" style="text-align: center"></span>
													<a href="../shop/deleteShopByID?shopid=${val.shopid}" onclick="return confirm('确实要删除该商品吗?')">删除商品</a>
												</button>
											</div>
										</div>
									</td>
								</tr>
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
									onclick="goNewPage(${currPage - 1})">上一页</a>
								</li>
								<c:forEach var="i" begin="1" end="${countPage}" step="1">
									<li id="page_${i}"><a href="javascript:void(0)"
										onclick="goNewPage(${i})">${i}</a></li>
								</c:forEach>
								<li>
									<a href="javascript:void(0)"
									onclick="goNewPage(${currPage + 1})">下一页</a>
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
<script type="text/javascript">
				var currentPage=${currPage};
				var totalPagerNumber = ${countPage};
				$("#page_"+currentPage).addClass("am-active");
				$("#search").click(function(){
					var data=$(".am-form-field").val();
					var url="../shop/shopIndex?currPage=1&IName="+data;
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
					var data='${IName}';
					window.location.href="../shop/shopIndex?currPage="+pageNum+"&IName="+data;
				}
				var message=document.getElementById("message").value;
				if(message!=null&&message!=""){
					alert(message);
				}
			</script>
</html>