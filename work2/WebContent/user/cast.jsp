<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>欢迎光临海格利斯游泳馆</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<div class="cart_box">
		<!--购物车-->
		<br>
		<br>
		<br>
		
		<div style="padding-left:140px;font-size:40px;">我的购物车</div>
		<div class="line20"></div>

		<table border="0" align="center" cellpadding="8" cellspacing="0"
			class="cart_table">
			<tbody>
				<tr>
					<th style="width:60px;text-align:center;">序号</th>
					<th style="width:110px;text-align:center;">商品图片</th>
					<th style="width:110px;text-align:center;">商品名称</th>
					<th style="width:110px;text-align:center;">用户ID</th>
					<th style="width:80px;text-align:center;">单价</th>
					<th style="width:80px;text-align:center;">数量</th>
					<th style="width:80px;text-align:center;">金额小计</th>
					<th style="width:100px;text-align:center;">收货地址</th>
					<th style="width:80px;text-align:center;">操作</th>
				</tr>

				<c:forEach items="${clock}" var="clock" varStatus="stauts">
				<tr>
					<td style="text-align:center;"> ${stauts.count}</td>
					<td style="text-align:center;">
						<a href="/goods/show-62.html">
						<img src="${clock.cpic}" style="width: 110px; height: 140px;">
						</a>
					</td>
					<td style="text-align:center;">${clock.ctitle}</td>
					<td style="text-align:center;">${clock.eid}</td>
					<td style="text-align:center;">${clock.cprize}</td>
					<td style="text-align:center;">${clock.countc}</td>
					<td style="text-align:center;">
						<font color="#FF0000" size="2">￥<label
							name="real_amount">${clock.makeupFlag}</label>
						</font>
					</td>
					<td style="text-align:center;">${clock.cendtime}</td>
					
					<td style="text-align:center;">
						<a href="">删除</a>
						<br/>
						<a onclick="" href="javascript:;">支付</a>
					</td>
				</tr>
				<br/>
			</c:forEach> 
			</tbody>
		</table>
		<div class="line20"></div>
		<div class="clear"></div>
	</div>
<div style="padding-top:390px;">
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
</html>
