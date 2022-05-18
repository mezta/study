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

<title></title>
<!-- Bootstrap -->
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
<meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="generator" content=""  data-variable=",cn,10001,,10001,M1156015" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<link rel='stylesheet' href='${basePath}css/ceshi.css'>
		 <link rel="stylesheet" href="../css/admin/amazeui.min.css" />
</head>
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
                                        <a href='${basePath}groups/getAllGroup?currPage=1'>
                                           会员套餐
                                        </a>
                                        >
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div class="met-news-list news-lists">
                
                            <ul class="met-page-ajax" data-scale=''>
                             <c:forEach items="${groupList}" var="val" varStatus="vs">
                                <li>
                                  <%--   <a class="img" href="newsshow.html" title=""  >
                                       项目${vs.index+1}:
                                    </a> --%>
                                    <h4>
                                        
                                          套餐${vs.index+1}
                                       
                                    </h4>
                                    <p class="info">
                                        <span>
                                            <i class="fa fa-calendar">
                                            </i>
                                            项目：${val.courseName1}
                                        </span>
                                        <span>
                                            <i class="fa fa-pencil-square">
                                            </i>
                                            项目次数：${val.course1Num}
                                        </span>
                                        <span>
                                            <i class="fa fa-calendar">
                                            
                                            </i>
                                            项目：${val.courseName2}
                                        </span>
                                        <span>
                                            <i class="fa fa-pencil-square">
                                            
                                            </i>
                                                                         项目次数：${val.course2Num}
                                            
                                        </span>
                                    </p>
                                    <p class="des">
                                 	有效期(天)：${val.day}
                                    </p>
                                 <p class="more">
                                    </p>
                                </li>
                            </c:forEach>
                          </ul>
                            
                            </div>
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
                                           <img alt="100%x180"
															src="${basePath}${val.pic}">
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

</script>
<script type="text/javascript">
				var currentPage=${currPage};
				$("#page_"+currentPage).addClass("am-active");
				$("#search").click(function(){
					var data=$(".am-form-field").val();
					var url="../groups/getAllGroup?currPage=1&IName="+data;
					window.location.href=url;
				});
				function goNewPage(pageNum){
					var data='${IName}';
					window.location.href="../groups/getAllGroup?currPage="+pageNum+"&IName="+data;
				}
				var message=document.getElementById("message").value;
				if(message!=null&&message!=""){
					alert(message);
				}
			</script>
</html>
