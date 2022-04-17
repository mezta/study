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
<style type="text/css">
.a2 {
			background-color: #F1EFC7;
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
                             <%--      <a class="img" href="newsshow.html" title="练瑜伽为什么要选择瑜伽馆，而非健身房？"  >
                              	套餐价格：<span style="color: red;">${val.price} 
                                    </a> --%>
                                    <h4>
                      <%--                   
                                          套餐${vs.index+1} --%>
                                        		团购套餐${val.gid}  
                                    </h4>
                                    <p style="font-size: 20px;	">
                                        <span>
                                            <i class="fa fa-calendar">
                                            </i>
                                            项目：${val.courseName1}
                                        </span>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>
                                            <i class="fa fa-pencil-square">
                                            </i>
                                            项目次数：${val.course1Num}
                                        </span>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      </p>
                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                       <p style="font-size: 20px;	">  
                                        <span>
                                            <i class="fa fa-calendar">
                                            
                                            </i>
                                            项目：${val.courseName2}
                                        </span>
                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>
                                            <i class="fa fa-pencil-square">
                                            
                                            </i>
                                                                         项目次数：${val.course2Num}
                                            
                                        </span>
                                    </p>
                                     <p class="more">
                                      套餐价格：<span style="color: red;">${val.price} 
                                    </p>
                                    <p class="more">
                                 	有效期(天)：<span style="color: red;">${val.day}
                                    </p>
                                    
                                 <p class="">
                        <form action="${basePath}empMsg/empMsgAdd" method="post">
							<input type="hidden" name="uname" value="${userMain.uname}">
							<input type="hidden" name="mcontent" value="${val.gid}">
							<input type="hidden" name="mprize" value="${val.price}">
							<input type="hidden" name="uid" value="${userMain.uid}">
							<input type="hidden" name="readflag" value="1">
							<c:if test="${userMain.uname == null}">
<!--                    		<a href="#"  onclick="display()" class="">购买套餐</a> 
 -->                   				 <a class="a2" href="#" style="background-color:orange;"onclick="display()">购买套餐</a>
                			</c:if>
							<c:if test="${userMain.uname != null}">
				                <!--  <button type="submit" class="">购买套餐</button> -->
				                <button style="background-color:orange;border:6px solid orange;width:75px;" type="submit" >购买套餐</button>
			                <!--   <a class="a2" href="#" style="background-color:orange;">购买套餐</a> -->
				 			</c:if>
						</form> 

                                    </p>
                    <%--  <c:if test="${userMain.uname != null}">
						<c:if test="${user.letter >= val.letter}">
						<form action="${basePath}empMsg/empMsgAdd" method="post">
							<input type="hidden" name="uname" value="${userMain.uname}">
							<input type="hidden" name="mcontent" value="${val.gid}">
							<input type="hidden" name="mprize" value="${val.price}">
							<input type="hidden" name="uid" value="${userMain.uid}">
							<input type="hidden" name="readflag" value="4">
							<input type="hidden" name="mcount" value="${val.letter}">
							<!-- <a class="a2" href="#" style="background-color:orange;">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp; -->
							<button style="background-color:orange;border:6px solid orange;" type="submit">积分兑换</button>&nbsp;&nbsp;&nbsp;&nbsp;
 						</form>
						</c:if>
					</c:if>
					<c:if test="${userMain.uname != null}">
						<c:if test="${user.letter < val.letter}">
								<a  style="color: #000000;padding: 11px; font-size: 13px;background-color:orange;" href="#" style="background-color:orange;" onclick="getLetter()">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 							<button style="background-color:orange;border:6px solid orange;type="submit"><a href="#" onclick="getLetter()">积分兑换</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
 -->						</c:if>
					</c:if>
					<c:if test="${userMain.uname == null}">
							<a class="a2" href="#" style="background-color:orange;" onclick="display()">积分兑换</a>&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 							<button style="background-color:orange;border:1px solid orange;width:100px;"><a href="#" onclick="display()">积分兑换</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
 -->               </c:if>
                                    	 --%>	
                                </li>
                            </c:forEach>
                          
                          </ul>
                            
                            </div>
                              <div class="">
					<%-- 		<div class="am-cf">
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
	alert("请先登录！");
}

</script>
 <script type="text/javascript">
	parent.layer.confirm('请先登录！', {
    btn: ['确定'], //按钮
    shade: false //不显示遮罩
    }, function display(){
    parent.layer.msg('请先登录！', {icon: 1});
    }
	});
</script> 
<script type="text/javascript">
				var currentPage=${currPage};
				var totalPagerNumber = ${countPage};
				$("#page_"+currentPage).addClass("am-active");
				$("#search").click(function(){
					var data=$(".am-form-field").val();
					var url="../groups/getAllGroup?currPage=1&IName="+data;
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
					var data='${IName}';
					window.location.href="../groups/getAllGroup?currPage="+pageNum+"&IName="+data;
				}
				var message=document.getElementById("message").value;
				if(message!=null&&message!=""){
					alert(message);
				}
			</script>
</html>
