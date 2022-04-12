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
 <link rel='stylesheet' href='${basePath}css/ceshi.css'>

<title>欢迎光临海格利斯游泳馆</title>
<!-- Bootstrap -->
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
		<section class="met-content animsition">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 met-cons">
                        <div class="met-position  pattern-show">
                            <div class="container">
                              <div class="row">
                                    <ol class="breadcrumb">
                                        <a href='${basePath}user/main.jsp'>
                                            主页
                                        </a>
                                        >
                                        <a href='${basePath}coach/getAllCoachs?currPage=1'>
                                            教练团队
                                        </a>
                                        >
                                    </ol>
                                </div>
                            </div>
                        </div>
                         <div class="met-news-list news-lists">
                        <div style="text-align:center;">
					<img alt="100%x180"
						src="${basePath}${coach.pic}"
						style="height: 300px; width: 60%;">
					
					<div style="text-align: center;">
						<div><p class="more" style='text-align:left;color:black' >教练姓名：${coach.name}</p></div>
						<div>
							<p class="more" style='text-align:left;color:black'>教练特点：${coach.feature}</p><span style="color: black;"></span>
						</div>
						<div>
							<p class="more" style='text-align:left;color:black'>教练介绍：${coach.descripe}</p><span style="color: black;"></span>
						</div>
							<div>
						
						</div>
							<p class="more" style='text-align:left; color:black'>主教项目：
						<c:forEach items="${course}" var="val" varStatus="vs">
									&nbsp;${val.courseName}
						  </c:forEach>
						  </p><span style="color: black;"></span>
					</div>
				</div>
			<%-- 	<p class="more" style='text-align:right; color:black'>
                                        <a href="${basePath}/course/getAllCourse?CName=${coach.name}"​ title="">
                                           	查看相关项目介绍>>

						
                                        </a>
                                    </p>  --%>
				</div>
						
						<div class="">
							<!-- <div class='met_pager'>
								<span class='PreSpan'>
									上一页
								</span>
								<a class="Ahover">
									1
								</a>
								<a href='list_12_2.html'>
									2
								</a>
								<a href='list_12_2.html'>
									下一页
								</a>
							</div> -->
						</div>
						
                    </div>
                    <div class="col-md-3 met-conx">
                        <div class="met-service">
                            <h3>
                                教练团队
                            </h3>
                            <c:forEach items="${coachs}" begin="0" end="1" var="val" varStatus="vs">
                            <ul>
                                <li>
                                    <a href="${basePath}coach/getAllCoachs?currPage=1"​ title="">
                                        <span>
                                           <img alt="20%x150" src="${basePath}${val.pic}">
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
                                        <a  href="${basePath}news/userGetNewsById?nid=${val.nid}" class="thumbnail"> ${val.title}
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
</html>
