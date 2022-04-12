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
<style>

</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="renderer" content="webkit" />

		<title>海格利斯游泳馆会员管理系统 </title>

		<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台" />
		<meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术" />


		<link rel="shortcut icon" href="favicon.ico" />
		<link href="${pageContext.request.contextPath}/hgls/css/bootstrap.min.css?v=3.3.7" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/hgls/css/font-awesome.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/hgls/css/animate.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/hgls/css/style.css?v=4.1.0" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/hgls/css/jquery.contextMenu.min.css" rel="stylesheet"/>
	</head>

	<body class="fixed-sidebar full-height-layout gray-bg " style="overflow: hidden;">
		<div id="wrapper">
		<%-- <nav class="navbar navbar-default navbar-cls-top " role="navigation"
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
		</nav> --%>
		
			<!--左侧导航开始-->
			<nav class="navbar-default navbar-static-side" role="navigation">
				<div class="nav-close"><i class="fa fa-times-circle"></i></div>
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<li class="nav-header">
							<div class="dropdown profile-element">
								<span><img alt="image" width="150" class="img-circle" src="${basePath}${adminInfo.apic}" 
								onerror="this.src='${basePath}/uploadfile/20220309/8.jpg';this.οnerrοr=null"  /></span> 
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
									<span class="clear">
										<span class="text-muted text-xs block" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										 欢迎${adminInfo.nickName}<b class="caret"></b></span>
									</span>
								</a>
								<ul class="dropdown-menu animated fadeInRight m-t-xs">
									<!-- <li><a class="J_menuItem" href="form_avatar.html">修改头像</a></li> -->
									<li><a class="J_menuItem" href="${basePath}/admin/getAdminInfomation?aid=1"
					target="right">个人资料</a></li>
									<!-- <li><a class="J_menuItem" href="contacts.html">联系我们</a></li>
									<li><a class="J_menuItem" href="mailbox.html">信箱</a></li> -->
									<li class="divider"></li>
									<li><a href="${basePath}/admin/logout">安全退出</a></li>
								</ul>
							</div>
							<div class="logo-element">Z</div>
						</li>
						
						<li><a class="J_menuItem"  href="${basePath}/admin/checkIndex?currPage=1" target="right">
						 <i class="fa fa-home"></i><span class="nav-label">会员信息管理</span></a>
						 </li>
				<li>
					<a  class="J_menuItem"  href="${basePath}/coach/coachIndex?currPage=1"target="right">
					<i class="fa fa-home"></i><span class="nav-label">健身教练管理</span></a></li>
				<li><a class="J_menuItem" href="${basePath}/course/courseIndex?currPage=1"
					target="right"><i class="fa fa-home"></i><span class="nav-label">健身项目管理</span></a></li>
				<li><a class="J_menuItem" href="../groups/groupIndex?currPage=1" target="right">
				<i class="fa fa-home"></i><span class="nav-label">会员套餐管理</span></a></li>
				<li><a class="J_menuItem" href="../shop/shopIndex?currPage=1" target="right">
				<i class="fa fa-home"></i><span class="nav-label">商品信息管理</span></a></li>
				<!-- <li><a class="J_menuItem" href="../type/typeIndex?currPage=1" target="right">
				<i class="fa fa-home"></i><span class="nav-label">健身知识管理</span></a></li> -->
				<li><a class="J_menuItem" href="${basePath}/empMsg/empMsgManage?pageNo=1"target="right">
				<i class="fa fa-home"></i><span class="nav-label">订单信息管理</span></a></li>
				<li><a class="J_menuItem" href="../news/newsIndex?currPage=1" target="right">
					<i class="fa fa-home"></i><span class="nav-label">公告管理</span></a></li>
				<li><a class="J_menuItem" href="../type/typeIndex?currPage=1" target="right">
					<i class="fa fa-home"></i><span class="nav-label">活动管理</span></a></li>
				<li><a class="J_menuItem" href="${basePath}/admin/getAdminInfomation?aid=1"
					target="right"><i class="fa fa-home"></i><span class="nav-label">个人信息修改</span></a></li>
				<li><a class="J_menuItem" href="${basePath}/config/getConfig" target="right">
				<i class="fa fa-home"></i><span class="nav-label">配置修改</span></a></li>
			</ul>
				
					
				</div>
			</nav>
			<!--左侧导航结束-->
			<!--右侧部分开始-->
			<div id="page-wrapper" class="gray-bg dashbard-1">
				<div class="row border-bottom">
					<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;">
						<!-- <div class="navbar-header">
							<a class="navbar-minimalize minimalize-styl-2 btn btn-primary" href="#"><i class="fa fa-bars"></i> </a>
							<form role="search" class="navbar-form-custom" method="post" action="search_results.html">
								<div class="form-group">
									<input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search" />
								</div>
							</form>
						</div> -->
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary" href="#"><i class="fa fa-bars"></i> </a>
						<ul class="nav navbar-top-links navbar-right">
							
			<div style="color: black; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
			当前时间:<a id="dateTime" style="color: black "></a> &nbsp; <a href="${basePath}/admin/logout"
				class="btn btn-danger square-btn-adjust">登出</a>
		   </div>
		   				
						
						</ul>
					</nav>
				</div>
				<div class="row content-tabs">
					<button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
					<nav class="page-tabs J_menuTabs">
						<div class="page-tabs-content">
							<a href="javascript:;"class="active J_menuTab" data-id="msgManage.jsp">首页</a> 
						</div>
					</nav>
					<button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
					<div class="btn-group roll-nav roll-right">
						<button class="dropdown" data-toggle="dropdown">页签操作<span class="caret"></span></button>
						<ul role="menu" class="dropdown-menu dropdown-menu-right">
							<li class="tabCloseCurrent"><a>关闭当前</a></li>
							<li class="J_tabCloseOther"><a>关闭其他</a></li>
							<li class="J_tabCloseAll"><a>全部关闭</a></li>
						</ul>
					</div>
					<a href="#" class="roll-nav roll-right tabReload"><i class="fa fa-refresh"></i> 刷新</a>
				</div>
				<div class="row J_mainContent" id="content-main">
					 <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${basePath}/admin/msgManage" frameborder="0" data-id="msgManage.jsp"  seamless></iframe>
			
			<!-- /. PAGE INNER  -->
				</div> 
				<div class="footer">
					<div class="pull-right">&copy; 2021-2022 <a href="#" target="_blank">海格利斯游泳馆</a></div>
				</div>
			</div>
			<!--右侧边栏开始-->
			<div id="right-sidebar">
				<div class="sidebar-container">
					<ul class="nav nav-tabs navs-3">
						<li class="active">
							<a data-toggle="tab" href="#tab-1"> <i class="fa fa-gear"></i> 主题 </a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="tab-1" class="tab-pane active">
							<div class="sidebar-title">
								<h3><i class="fa fa-comments-o"></i> 主题设置</h3>
								<small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
							</div>
							<div class="skin-setttings">
								<div class="title">主题设置</div>
								<div class="setings-item">
									<span>收起左侧菜单</span>
									<div class="switch">
										<div class="onoffswitch">
											<input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu" />
											<label class="onoffswitch-label" for="collapsemenu">
												<span class="onoffswitch-inner"></span>
												<span class="onoffswitch-switch"></span>
											</label>
										</div>
									</div>
								</div>
								<div class="setings-item">
									<span>固定顶部</span>

									<div class="switch">
										<div class="onoffswitch">
											<input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar" />
											<label class="onoffswitch-label" for="fixednavbar">
												<span class="onoffswitch-inner"></span>
												<span class="onoffswitch-switch"></span>
											</label>
										</div>
									</div>
								</div>
								<div class="setings-item">
									<span>
										固定宽度
									</span>

									<div class="switch">
										<div class="onoffswitch">
											<input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout" />
											<label class="onoffswitch-label" for="boxedlayout">
												<span class="onoffswitch-inner"></span>
												<span class="onoffswitch-switch"></span>
											</label>
										</div>
									</div>
								</div>
								<div class="title">皮肤选择</div>
								<div class="setings-item default-skin nb">
									<span class="skin-name">
										<a href="#" class="s-skin-0">
											默认皮肤
										</a>
									</span>
								</div>
								<div class="setings-item blue-skin nb">
									<span class="skin-name">
										<a href="#" class="s-skin-1">
											蓝色主题
										</a>
									</span>
								</div>
								<div class="setings-item yellow-skin nb">
									<span class="skin-name">
										<a href="#" class="s-skin-3">
											黄色/紫色主题
										</a>
									</span>
								</div>
							</div>
						</div>
			<!--右侧边栏结束-->
			
	

		<!-- 全局js -->
		<script src="${pageContext.request.contextPath}/hgls/js/jquery.min.js?v=2.1.4"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/bootstrap.min.js?v=3.3.7"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/plugins/contextMenu/jquery.contextMenu.min.js"></script>
		<script src="${pageContext.request.contextPath}/hgls/js/plugins/layer/layer.min.js"></script>

		<!-- 自定义js -->
		<script src="${pageContext.request.contextPath}/hgls/js/hplus.js?v=4.1.0"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/hgls/js/contabs.js"></script>

		<!-- 第三方插件 -->
		<script src="${pageContext.request.contextPath}hgls/js/plugins/pace/pace.min.js"></script>

<!-- <script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script> -->
<!-- <script src="../js/admin/material.min.js" type="text/javascript"></script>
 Charts Plugin
<script src="../js/admin/chartist.min.js"></script>

Material Dashboard DEMO methods, don't include it in your project!

<script type="text/javascript" src="../js/admin/myplugs/js/plugs.js">

</script>
	<script type="text/javascript" src="../js/admin/myplugs/js/plugs.js">
	
</script> --> -->
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



	</body>
</html>
