<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>

<style type="text/css">
.carousel {
	height: 500px;
	background-color: #000;
}

.carousel .item {
	height: 500px;
	background-color: #000;
}

.carousel img {
	padding-top: 60px;
	height: 500px;
	width: 100%;
}
</style>

</head>
<body>
	<div class="container-fruid">
		<div class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="padding-left: 30px;">
			<div class="navbar-header">
				<span class="navbar-brand">欢迎光临海格利斯游泳馆</span>
			</div>
			<ul class="nav navbar-nav">
			    <li><a href="${basePath}user/main.jsp">网站首页</a></li>
				
				<c:if test="${userMain.uname == null}">
                   	<li><a href="${basePath}user/login.jsp">登录</a></li>
                 </c:if>
				<c:if test="${userMain.uname != null}">
                    <li>
                    	<a>欢迎 ${userMain.uname}</a>
                    </li>
                    <li>
                    	<a href="${basePath}user/getUserInfomation?uid=${userMain.uid}">个人中心</a>
                    </li>
                    <li>
                    	<a href="${basePath}user/quit">退出</a>
                    </li>
  				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right" style="padding-right: 30px; ">

				<li><a href="${basePath}course/getAllCourse">健身项目</a></li>
				<li><a href="${basePath}coach/getAllCoach">教练团队</a></li>
				<li><a href="${basePath}groups/getAllGroup">会员套餐</a></li>
				<li><a href="${basePath}shop/getAllShop">热销商品</a></li>
				<c:if test="${userInfo.uname == null}">
                   	<li><a href="#" onclick="display()">我的订单</a></li>
                 </c:if>
				<c:if test="${userMain.uname != null}">
                    <li>
                    	<a href="${basePath}user/getMain?uid=${userMain.uid}">我的订单</a>
                    </li>
  				</c:if>
				<li><a href="${basePath}news/getAllNews">最新公告</a></li>
				<li><a href="${basePath}type/getAllTypes">最新活动</a></li>
			</ul>
		</div>

		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel" style="margin-top: -20px;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="${basePath}images/banner/1.jpg" alt="1">
				</div>
				<div class="item">
					<img src="${basePath}images/banner/2.jpg" alt="2">
				</div>
				<div class="item">
					<img src="${basePath}images/banner/3.jpg" alt="3">
				</div>
				<div class="item">
					<img src="${basePath}images/banner/7.jpg" alt="3">
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

	</div>
</body>
<script>
function display() {
	alert("请先登录！");
}

</script>
</html>
