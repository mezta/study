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
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
<meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="generator" content=""  data-variable=",cn,10001,,10001,M1156015" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<link rel='stylesheet' href='${basePath}css/ceshi.css'>
</head>
<style type="text/css">
.a2 {
		
			color: #000000;
			padding: 10px;
			text-decoration: none;
			font-size: 12px;
			box-shadow: #666 0px 0px 6px;
		}
		.a2:active{
			background-color: #bdbc9d;
		}

</style>
<body class="nav-header">
<jsp:include page="header.jsp"></jsp:include>

		<section class="met-content animsition">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 met-cons">
                        <div class="met-position bordernone pattern-show">
                            <div class="container">
                                <div class="row">
                                    <ol class="breadcrumb">
                                        <a href='${basePath}user/main.jsp'>
                                            主页
                                        </a>
                                        >
                                        <a href='${basePath}shop/getAllShop?currPage=1'>
                                           商品信息
                                        </a>
                                        >
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="met-news-list news-lists">
                        
                       <!--   <ul class="met-page-ajax" data-scale=''>  -->
                                 <div style="text-align: center;">
                                  <a class="img" href="newsshow.html" title="练瑜伽为什么要选择瑜伽馆，而非健身房？"  >
                                  <img src="${basePath}${shop.pic}"
						style="height:350px; width: 60%;">
                                   
                                    </a>
                                    
                                    <h4>
                                        
                                          ${shop.shopname}
                                       
                                    </h4>
                                    <p class="info">
                                        <span>
                                            <i class="fa fa-calendar">
                                            </i>
                                            商品介绍：${shop.content}
                                        </span>
                                       
                                       
                                      <%--   <span>
                                            <i class="fa fa-pencil-square">
                                            
                                            </i>
                                                                         项目2次数：${val.course2Num}
                                            
                                        </span>
                                    </p>--%>
                                    <p class="des">
                                 	 <span>
                                            <i class="fa fa-pencil-square">
                                            </i>
                                            商品价格：<span style="color: red;">${shop.price}
                                        </span>
                                        &nbsp;&nbsp;&nbsp;
                                        </span>
                                        <span>
                                            <i class="fa fa-pencil-square">
                                            
                                            </i>
                                            商品所需积分：<span style="color: red;">${shop.letter}
                                        </span>
                                    </p> 
                                 <p class="more">
                                       
                         <form action="${basePath}empMsg/empMsgAdd" method="post">
							<input type="hidden" name="uname" value="${userMain.uname}">
							<input type="hidden" name="mcontent" value="${shop.shopid}">
							<input type="hidden" name="mprize" value="${shop.price}">
							<input type="hidden" name="uid" value="${userMain.uid}">
							<input type="hidden" name="readflag" value="2">
							<input type="hidden" name="mcount" value="${shop.letter}">
							<c:if test="${userMain.uname != null}">
                   				<!-- <a class="a2" href="#" style="background-color:orange;"">购买</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
                   				<button style="background-color:orange;font-size: 12px;border:7px solid orange;type="submit">点击购买</button>&nbsp;&nbsp;&nbsp;&nbsp;
               			</c:if>
                 			<c:if test="${userMain.uname == null}">
                   				<a class="a2" href="#" style="background-color:orange;" onclick="display()">点击购买</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        	<!-- <button style="background-color:orange;border:1px solid orange;width:100px"><a href="#" onclick="display()">购买</a></button>&nbsp;&nbsp;&nbsp;&nbsp; -->
                 			</c:if>
						</form>
						&nbsp;	
						</p>
						<p calss="more" >
					<c:if test="${userMain.uname != null}">
						<c:if test="${user.letter >= shop.letter}">
						<form action="${basePath}empMsg/empMsgAdd" method="post">
							<input type="hidden" name="uname" value="${userMain.uname}">
							<input type="hidden" name="mcontent" value="${shop.shopid}">
							<input type="hidden" name="mprize" value="${shop.price}">
							<input type="hidden" name="uid" value="${userMain.uid}">
							<input type="hidden" name="readflag" value="3">
							<input type="hidden" name="mcount" value="${shop.letter}">
							<!-- <a class="a2" href="#" style="background-color:orange;">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
							<button style="background-color:orange;border:6px solid orange;" type="submit">积分兑换</button>&nbsp;&nbsp;&nbsp;&nbsp;
 						</form>
						</c:if>
					</c:if>
					<c:if test="${userMain.uname != null}">
						<c:if test="${user.letter < shop.letter}">
								<a  style="color: #000000;padding: 11px; font-size: 13px;background-color:orange;" href="#" style="background-color:orange;" onclick="getLetter()">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 							<button style="background-color:orange;border:6px solid orange;type="submit"><a href="#" onclick="getLetter()">积分兑换</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
 -->						</c:if>
					</c:if>
					<c:if test="${userMain.uname == null}">
							<a class="a2" href="#" style="background-color:orange;" onclick="display()">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 							<button style="background-color:orange;border:1px solid orange;width:100px;"><a href="#" onclick="display()">积分兑换</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
 -->                	</c:if>
                    </div>
						<a style="margin-left:430px;">(当前可用积分：${user.letter})</a>
                                    </p>

                         <!--  </ul> -->
                            <div class="">
                            </div>
                        </div>
                    </div>
                      
                    <div class="col-md-3 met-conx">
                        <div class="met-service">
                            <h3>
                                教练团队
                            </h3>
                             <c:forEach items="${coach}" begin="0" end="1" var="val" varStatus="vs">
                            <ul>
                                <li>
                                    <a href="${basePath}coach/getAllCoachs?currPage=1"​ title="">
                                        <span>
                                           <img alt="100%x180" src="${basePath}${val.pic}">
                                        </span>
                                        <h6>
                                           ${val.name}
                                        </h6>
                                    </a>
                                </li>
                                </c:forEach>
                  
                            </ul>
                        </div>
                        <div class="met-information">
                       
                            <h3>
                                新闻资讯
                            </h3>
                       <ul>
                            <c:forEach items="${news}" begin="0" end="2" var="val" varStatus="vs">

                                <li>
                                    <h6>
                                        <a href="${basePath}news/userGetNewsById?nid=${val.nid}" class="thumbnail"> ${val.title}
					</a>
                                    </h6>
                                </li>

                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
function getLetter() {
	alert("积分不足！");
}
</script>
</html>
