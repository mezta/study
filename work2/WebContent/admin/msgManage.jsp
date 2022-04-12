 <!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.bean.Admin" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
    request.setAttribute("basePath", basePath);
    Admin adminInfo = (Admin) request.getSession().getAttribute("admin");
    request.setAttribute("adminInfo", adminInfo);
%>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--360浏览器优先以webkit内核解析-->

		<title>H+ 后台主题UI框架 - 主页示例</title>

		<link rel="shortcut icon" href="favicon.ico" />
		<link href="${pageContext.request.contextPath}/hgls/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/hgls/css/font-awesome.css?v=4.4.0" rel="stylesheet" />

		<link href="${pageContext.request.contextPath}/hgls/css/animate.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/hgls/css/style.css?v=4.1.0" rel="stylesheet" />
	</head>

	<body class="gray-bg">
		<div class="row border-bottom white-bg dashboard-header">
				<h1>
					欢迎登录海格利斯游泳馆会员管理系统
				</h1>
		</div>
		<div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="carousel slide" id="carousel3">
                            <div class="carousel-inner">
                                <div class="item gallery active left">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big1.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big2.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big3.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big1.jpg">
                                        </div>
                                    </div>
                                </div>
                                <div class="item gallery next left">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big3.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big1.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big2.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big1.jpg">
                                        </div>
                                    </div>
                                </div>
                                <div class="item gallery">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big2.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big3.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big1.jpg">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath}/hgls/img/p_big2.jpg">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		

		<!-- 全局js -->
		<script src="${pageContext.request.contextPath}/hgls/js/jquery.min.js?v=2.1.4"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/bootstrap.min.js?v=3.3.7"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/plugins/layer/layer.min.js"></script>

		<!-- 自定义js -->
		<script src="${pageContext.request.contextPath}/hgls/js/content.js"></script>

		<!-- 欢迎信息 -->
		<script src="${pageContext.request.contextPath}/hgls/js/welcome.js"></script>
	</body>
</html>