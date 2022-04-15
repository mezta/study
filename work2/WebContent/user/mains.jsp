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
        <meta name="keywords" content="高端大气,响应式,瑜伽,健身会馆,网站前端模板,模板下载" />
        <meta name="description" content="高端大气响应式瑜伽健身会馆网站前端模板下载，全站完整版网页模板下载。" /> 
        <meta name="author" content="js代码" />
        <meta name="copyright" content="js代码" />

<title>欢迎光临海格利斯游泳馆</title>
<!-- Bootstrap -->
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
<link rel='stylesheet' href='${basePath}css/ceshi.css'>

</head>
 <style>
        .my-alert {
            position: absolute;
            z-index: 1000;
            width: 310px;
            height: 146px;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
        }
        .my-alert .title {
            height: 108px;
            width: 100%;
            box-sizing: border-box;
            padding: 28px;
            line-height: 24px;
            font-size: large;
        }

        .my-alert .button {
            text-align: center;
        }
        .my-alert .button button {
            width: 120px;
            height: 30px;
            border: none;
            outline: none;
            background-color: #5c8bec;
            cursor: pointer;
        }
    </style>
<body  class=" nav-header">

	<jsp:include page="header.jsp"></jsp:include>

	<%-- <iframe src="${basePath}coach/getAllCoachList" width="100%"
	height="400" name="right" style="border: none;"></iframe> --%>
	
	<%-- <iframe src="${basePath}groups/getAllGroups" width="100%"
	height="400" name="right" style="border: none;"></iframe> --%>
	
	<%--  <br />
	<jsp:include page="footer.jsp"></jsp:include> --%>
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
                                <a href="#" title="">
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
                                <a href="#" title="">
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
                                <a href="#" title="">
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
                                <a href="#" title="">
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
                                <a href="#" title="">
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
                                <a href="#" title="">
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
                    <p style="text-align: center;">@海格利斯游泳馆</p>
                </div>
            </div>
        </footer>
        <button type="button" class="btn btn-icon btn-primary btn-squared met-scroll-top hide">
            <i class="icon wb-chevron-up" aria-hidden="true">
            </i>
        </button>
     

     
</body>
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function display_alert() {
		alert("请先登录！");
		location.href="${basePath}/user/login.jsp"; 
	}

    var message = document.getElementById("message").value;
    if (message != null && message != "") {
        alert(message);
    }
    
   
</script>
<script type="text/javascript">
var arry=new Array();

function createAlert(mcontent, mreceiver) {
    let div = document.createElement("div");
    div.classList.add("my-alert")
    
    let title = document.createElement("div");
    title.classList.add("title");
    //title.innerText = "您的套餐：" + mcontent +" 剩余天数："+ mreceiver + "请及时续费！！";
    title.innerText = "您的套餐"+mcontent+"  还有"+ mreceiver +"就到期啦！请即使续费哦!";
    div.appendChild(title);

    let button = document.createElement("div");
    button.classList.add("button");
    let btn = document.createElement("button");
    btn.innerHTML = "确定"
    btn.onclick = function() {
        div.remove();
    }
    button.appendChild(btn);

    div.appendChild(button)


    document.body.appendChild(div);
}


<c:forEach items="${daqi}" var="val">
createAlert(${val.mcontent},"${val.mreceiver}")
</c:forEach>

</script>
<script src="../js/ceshi.js">
        </script>
</html>
