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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="generator" content=""  data-variable=",cn,10001,,10001,M1156015" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="author" content="js代码" />
        <meta name="copyright" content="js代码" />

<title></title>
<!-- Bootstrap -->
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
<link rel='stylesheet' href='css/ceshi.css'>
</head>
<body class=" nav-header">
	<jsp:include page="header.jsp"></jsp:include>
	<%-- <iframe src="${basePath}coach/getAllCoachList" width="100%"
	height="400" name="right" style="border: none;"></iframe>
	 --%>
	<%-- <iframe src="${basePath}groups/getAllGroups" width="100%"
	height="400" name="right" style="border: none;"></iframe> --%>
	 <div class="service-background">
            <div class="container">
                <div class="title-box">
                    <h2>
                        优秀服务
                    </h2>
                    <p>
                             缤纷活动，人气登场，带你走进梦的殿堂；越练越健康，越练越美丽，越练越吸粉
                    </p>
                </div>
                <div class="row">
                    <div class="service-box">
                        <ul class="service-wraper">
                            <li class="service-slide">
                                <a href="#" title="塑形美体">
                                    <b>
                                        <img src="${basePath}images/fu.png">
                                        <img class="icon" src="${basePath}images/icon-1.png">
                                    </b>
                                    <h3>
                                        优秀团队
                                    </h3>

                                </a>
                            </li>
                            <li class="service-slide">
                                <a href="#" title="经典纯粹">
                                    <b>
                                        <img src="${basePath}images/fu.png">
                                        <img class="icon" src="${basePath}images/icon-2.png">
                                    </b>
                                    <h3>
                                        健身项目
                                    </h3>
                                   
                                </a>
                            </li>
                            <li class="service-slide">
                                <a href="#" title="理疗修复">
                                    <b>
                                        <img src="${basePath}images/fu.png">
                                        <img class="icon" src="${basePath}images/icon-3.png">
                                    </b>
                                    <h3>
                                        会员套餐
                                    </h3>
                                    
                                </a>
                            </li>
                            <li class="service-slide">
                                <a href="#" title="情绪释放">
                                    <b>
                                        <img src="${basePath}images/fu.png">
                                        <img class="icon" src="${basePath}images/icon-4.png">
                                    </b>
                                    <h3>
                                        热销产品
                                    </h3>
                                    
                                </a>
                            </li>
                            <li class="service-slide">
                                <a href="#" title="职业老师">
                                    <b>
                                        <img src="${basePath}images/fu.png">
                                        <img class="icon" src="${basePath}images/icon-2.png">
                                    </b>
                                    <h3>
                                        最新公告
                                    </h3>
                                   
                                </a>
                            </li>
                            <li class="service-slide">
                                <a href="#" title="职业老师">
                                    <b>
                                        <img src="${basePath}images/fu.png">
                                        <img class="icon" src="${basePath}images/icon-3.png">
                                    </b>
                                    <h3>
                                        最新活动
                                    </h3>
                                   
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

      
        <footer>
            <div class="container text-center">
                <div class="powered_by_metinfo">
                    <p style="text-align: center;">@海格利斯游泳馆</span></p>
                </div>
            </div>
        </footer>
        <button type="button" class="btn btn-icon btn-primary btn-squared met-scroll-top hide">
            <i class="icon wb-chevron-up" aria-hidden="true">
            </i>
        </button>
     

</body>
<script src="${basePath}js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script>
function display() {
	alert("请先登录！");
}


</script>
   <script src="js/ceshi.js">
        </script>
</html>
