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
 <!-- Google Font -->
  <link rel='stylesheet' href='${basePath}css/ceshi.css'>
 <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,300i,400,500,700,900" rel="stylesheet">

 <!-- Css Styles -->
 <link rel="stylesheet" href="${basePath}css/user/bootstrap.min.css" type="text/css">
 <link rel="stylesheet" href="${basePath}css/user/font-awesome.min.css" type="text/css">
 <link rel="stylesheet" href="${basePath}css/user/owl.carousel.min.css" type="text/css">
 <link rel="stylesheet" href="${basePath}css/user/magnific-popup.css" type="text/css">
 <link rel="stylesheet" href="${basePath}css/user/barfiller.css" type="text/css">
 <link rel="stylesheet" href="${basePath}css/user/slicknav.min.css" type="text/css">
 <link rel="stylesheet" href="${basePath}css/user/style.css" type="text/css">
<title>欢迎光临海格利斯游泳馆</title>
<!-- Bootstrap -->
<style>
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
 <link rel='stylesheet' href='css/ceshi.css'>
</head>
<body>
	 <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-menu">
                        <nav class="mobile-menu">
                            <ul>
                                <li><a href="${basePath}user/main.jsp">网站首页</a></li>
                                <c:if test="${userMain.uname == null}">
			                 		<li><a href="${basePath}user/login.jsp">登录</a></li>
			              		</c:if>
								<c:if test="${userMain.uname != null}">
					                  <li>
					                  	<a style='color:white'>欢迎 ${userMain.nickName}</a>
					                  </li>
					                  <li>
					                  	<a href="${basePath}user/getUserInfomation?uid=${userMain.uid}" >个人中心</a>
					                  </li>
					                  <li>
					                  	<a href="${basePath}user/quit">退出</a>
					                  </li>
								</c:if>
                                <li><a href="${basePath}course/getAllCourse?currPage=1">健身项目</a></li>
								<li><a href="${basePath}coach/getAllCoachs?currPage=1">教练团队</a></li>
								<li><a href="${basePath}groups/getAllGroup?currPage=1">会员套餐</a></li>
								<li><a href="${basePath}shop/getAllShop?currPage=1">热销商品</a></li>
								<c:if test="${userInfo.uname == null}">
				                   	<li><a href="#" onclick="display()">我的订单</a></li>
				                 </c:if>
								<c:if test="${userMain.uname != null}">
				                    <li>
				                    	<a href="${basePath}user/getMain?uid=${userMain.uid}">我的订单</a>
				                    </li>
				  				</c:if>
								<li><a href="${basePath}news/getAllNews?currPage=1">最新公告</a></li>
								<li><a href="${basePath}type/getAllTypes?currPage=1">最新活动</a></li>
			                  </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    <section class="hero-slider">
        <div class="slide-items owl-carousel">
            <div class="single-slide set-bg active" data-setbg="${basePath}images/banner/1.jpg">
            </div>
            <div class="single-slide set-bg" data-setbg="${basePath}images/banner/2.jpg">
            </div>
            <div class="single-slide set-bg" data-setbg="${basePath}images/banner/3.jpg">
            </div>
        </div>
    </section>
</body>
<script>
function display() {
	alert("请先登录！");
}

</script>
    <script src="${basePath}js/user/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/user/bootstrap.min.js"></script>
    <script src="${basePath}js/user/jquery.slicknav.js"></script>
    <script src="${basePath}js/user/owl.carousel.min.js"></script>
    <script src="${basePath}js/user/jquery.magnific-popup.min.js"></script>
    <script src="${basePath}js/user/circle-progress.min.js"></script>
    <script src="${basePath}js/user/jquery.barfiller.js"></script>
    <script src="${basePath}js/user/main.js"></script>
</html>
