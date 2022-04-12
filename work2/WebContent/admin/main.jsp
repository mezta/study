<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bean.Admin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
	request.setAttribute("basePath", basePath);
	Admin adminInfo = (Admin) request.getSession().getAttribute("admin");
	request.setAttribute("adminInfo", adminInfo);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>利道健身后台</title>
<!-- BOOTSTRAP STYLES-->
<link href="../css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="../css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="../js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="../css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">${adminInfo.nickName}</a>
		</div>
		<div
			style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			当前时间:<a id="dateTime" style="color: white"></a> &nbsp; <a
				href="${basePath}/admin/logout"
				class="btn btn-danger square-btn-adjust">登出</a>
		</div>
		</nav>
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li class="text-center"><img src="${basePath}${adminInfo.apic}"
					class="user-image img-responsive"
					onerror="this.src='${basePath}/images/find_user.png';this.οnerrοr=null" /></li>
					
				<li><a href="${basePath}/coach/coachIndex?currPage=1"
					target="right"><i class="fa fa-qrcode fa-3x"></i> 教练管理</a></li>
				<li><a href="${basePath}/course/courseIndex?currPage=1"
					target="right"><i class="fa fa-qrcode fa-3x"></i> 健身项目管理</a></li>
				<li><a href="../groups/groupIndex?currPage=1" target="right"><i
						class="fa fa-edit fa-3x"></i>&nbsp;会员套餐管理</a></li>
				<li><a href="../news/newsIndex?currPage=1" target="right"><i
						class="fa fa-edit fa-3x"></i>&nbsp;公告管理</a></li>
				<li><a href="../type/typeIndex?currPage=1" target="right"><i
						class="fa fa-edit fa-3x"></i>&nbsp;活动管理</a></li>
				<li><a href="../shop/shopIndex?currPage=1" target="right"><i
						class="fa fa-edit fa-3x"></i>&nbsp;商品管理</a></li>			
				<li><a href="${basePath}/empMsg/empMsgManage?pageNo=1"
					target="right"><i class="fa fa-desktop fa-3x"></i>&nbsp;订单信息管理</a></li>
				<li><a href="${basePath}/admin/checkIndex?currPage=1" target="right"><i
						class="fa fa-table fa-3x"></i>&nbsp;用户管理</a></li>
				<li><a href="${basePath}/admin/getAdminInfomation?aid=1"
					target="right"><i class="fa fa-square-o fa-3x"></i>&nbsp;个人信息修改</a></li>
				<li><a href="${basePath}/config/getConfig" target="right"><i
						class="fa fa-square-o fa-3x"></i>&nbsp;配置修改</a></li>
			</ul>
		</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<!-- /. ROW  -->
			<div class="content">
				<div class="container-fluid">
					<div class="row" style="margin-top: 15px;">

						<iframe src="${basePath}/admin/msgManage" width="100%"
							height="900" name="right" style="border: none;"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery-1.10.2.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.metisMenu.js"></script>
	<script src="../js/morris/raphael-2.1.0.min.js"></script>
	<script src="../js/morris/morris.js"></script>
	<script src="../js/custom.js"></script>


</body>

<!--   Core JS Files   -->
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="../js/admin/material.min.js" type="text/javascript"></script>

<script src="../js/admin/chartist.min.js"></script>

<script type="text/javascript" src="../js/admin/myplugs/js/plugs.js">
	
</script>
<script type="text/javascript">
	//添加编辑弹出层
	function updatePwd(title, id) {
		$.jq_Panel({
			title : title,
			iframeWidth : 500,
			iframeHeight : 300,
			url : "updatePwd.html"
		});
	}
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".nav li a").click(function() {
							$(".nav li a").removeClass("active-menu");
							$(this).addClass("active-menu");

						})
						//处理系统当前时间
						Date.prototype.format = function(fmt) {
							var o = {
								"y+" : this.getFullYear, //年
								"M+" : this.getMonth() + 1, //月份
								"d+" : this.getDate(), //日
								"h+" : this.getHours(), //小时
								"m+" : this.getMinutes(), //分
								"s+" : this.getSeconds()
							//秒
							};
							if (/(y+)/.test(fmt))
								fmt = fmt.replace(RegExp.$1, (this
										.getFullYear() + "")
										.substr(4 - RegExp.$1.length));
							for ( var k in o)
								if (new RegExp("(" + k + ")").test(fmt))
									fmt = fmt
											.replace(
													RegExp.$1,
													(RegExp.$1.length == 1) ? (o[k])
															: (("00" + o[k])
																	.substr(("" + o[k]).length)));
							return fmt;
						}
						setInterval(
								"document.getElementById('dateTime').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');",
								1000);

					});
	function updateAdmin() {
		window.location.href = "${basePath}/amdin/getAdminInfomation";
	}
</script>

</html>