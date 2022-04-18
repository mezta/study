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

        <meta name="description" content="" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="generator" content=""  data-variable=",cn,10001,,10001,M1156015" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
         <link rel="stylesheet" href="../css/admin/amazeui.min.css" />
       <meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
<title></title>
<!-- Bootstrap -->
<%-- <link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
 --%><script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
<link rel='stylesheet' href='${basePath}css/ceshi.css'>
<style type="text/css">
 a {
  -webkit-tap-highlight-color: transparent;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
} 
</style>
</head>
<body class="nav-header">
	<jsp:include page="header.jsp"></jsp:include>
	<!-- <div class="panel-heading">&nbsp;</div>
		<h3 align="center">健身项目</h3> -->
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
                                        <a href='${basePath}course/getAllCourse?currPage=1'>
                                           健身项目
                                        </a>
                               </ol>
                               &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                  
                               <div class="am-input-group am-input-group-sm">
					<input type="text" style="width:150px; text-align:right;"  class="am-form-field" id="searchData"value="${CName}"> <span class="am-input-group-btn">
					<button  style="text-align:right" class="am-btn am-btn-default" type="button" id="search">查询项目</button>
					</span>
							</div>	
                                </div>
                                
                            </div>
                        </div>
                        <div class="met-news-list news-lists">
                   
                            <ul class="met-page-ajax" data-scale=''>
                                                    <c:forEach items="${courseList}" var="val" varStatus="vs">
                            
                                <li>
                                  <%--   <a class="img" href="newsshow.html" title="练瑜伽为什么要选择瑜伽馆，而非健身房？"  >
                                       项目${vs.index+1}:
                                    </a> --%>
                                    <h4>
                                        
                                          项目名称：${val.courseName}
                                       
                                    </h4>
                                    <p class="info">
                                        <span>
                                            <i class="fa fa-calendar">
                                            </i>
                                            项目时间：${val.time}
                                        </span>
                                        <span>
                                            <i class="fa fa-address-card">
                                            </i>
                                            主教练：${val.name}
                                        </span>
                                        <span>
                                            <i class="fa fa-pencil-square">
                                            </i>
                                            项目分类：${val.classify}
                                        </span>
                                        <span>
                                            <i class="fa fa-hourglass">
                                            
                                            </i>
                                            项目课时：${val.num}	
                                        </span>
                                    </p>
                                    <p class="des">
                                  		 项目描述：${val.content}
                                    </p>
                                  <p class="more">
                                  <c:if test="${userMain.uname == null}">
                                        <a href=""​ onclick="display()"title="">
                                           相关会员套餐>>
								</c:if>
								 <c:if test="${userMain.uname != null}">
                                        <a href="${basePath}course/getAllCourseByName?TName=${val.courseName}"​title="">
                                           相关会员套餐>>
								</c:if>
						
                                        </a>
                                    </p> 
                                </li>
                            </c:forEach>
                          </ul>
                          </div>
                            <div class="">
					<%-- 	<div class="am-cf">
 						共${count}条记录
						<div class="met_pager">
							<ul class="am-pagination">
								<li><a href="javascript:void(0)" onclick="goNewPage(1)">«</a>
								</li>
								<c:forEach var="i" begin="1" end="${countPage}" step="1">
									<li id="page_${i}"><a href="javascript:void(0)"
										onclick="goNewPage(${i})">${i}</a></li>
								</c:forEach>
								<li><a href="javascript:void(0)"
									onclick="goNewPage(${countPage})">»</a></li>
							</ul>
						</div>
					</div> --%>
								<div class="am-cf pager">
						
						<div 
						
						style="margin: 0 auto;"
						
						class=" pager-items">
						
						
						
							<ul 
							
							style="text-align:center;"
							
							class="am-pagination">
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
							
							
							
						</div>
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
	alert("详细内容，请先登录哦！");
}


</script>

<script type="text/javascript">
				var currentPage=${currPage};
				var totalPagerNumber = ${countPage};
				$("#page_"+currentPage).addClass("am-active");
				$("#search").click(function(){
					var data=$(".am-form-field").val();
					var url="../course/getAllCourse?currPage=1&CName="+data;
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
					var data='${lTitle}';
					window.location.href="../course/getAllCourse?currPage="+pageNum+"&CName="+data;
				}
				var message=document.getElementById("message").value;
				if(message!=null&&message!=""){
					alert(message);
				}
			</script>
<script src="js/ceshi.js"></script>
</html>
