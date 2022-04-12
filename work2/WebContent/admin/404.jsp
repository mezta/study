<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>该页面不存在</title>

<link rel="stylesheet" href="<%=basePath%>css/admin/404.css"></link>

<script src="<%=basePath%>js/jquery-3.1.0.min.js"></script>

</head>
<body>
<div >
	<div style="text-align:center;">
		<div class="settings">
			<i class="icon"></i>
			<img src="<%=basePath%>images/404.png" alt=""
					style="width: 400px; height: 300px;">
			<h4>很抱歉！没有找到您要访问的页面！</h4>
			<p><span id="num">5</span> 秒后将自动跳转</p>
			<div >
				<a href="javascript:history.back(-1)" title="上一步" id="reload-btn">上一步</a>
			</div>
		</div>
	</div>
</div>
<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="<%=basePath%>js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=basePath%>js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="<%=basePath%>js/main.js"></script>
<script>
	//倒计时跳转到首页的js代码
	var $_num=$("#num");
	var num=parseInt($_num.html());
	var numId=setInterval(function(){
		num--;
		$_num.html(num);
		if(num===0){
			//跳转地址写在这里
			window.location.href=history.back(-1);
		}
	},1000);
	//返回按钮单击事件
	var reloadPage = $("#reload-btn");
	reloadPage.click(function(e){
		window.history.back();
	});
</script>

</body>
</html>