<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="${basePath}css/perfect-scrollbar.min.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${basePath}css/tas.min.css">
<link rel="stylesheet" href="${basePath}css/admin/amazeui.min.css" />
<link rel="stylesheet" href="${basePath}css/admin/admin.css" />
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header end -->
	<div style="width: 100%; height: 50px;"></div>
	<div class="container text-right clearfix">
		<ol class="breadcrumb col-fix-padding">
			<li><a href="${basePath}">首页</a></li>
			<li class="active">我的订单</li>
		</ol>
	</div>
	<div class="container faq">
		<div class="faq-list">
			<div></div>
			<table class="table table-hover">
				<tr>
					<td>序号</td>
					<td>订单用户</td>
					<td>课时数</td>
					<td>价格</td>
					<td>有效期</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${msgs}" var="msgs" varStatus="s">
					<tr>
						<td>${s.count}</td>
						<td>${msgs.uid}</td>
						<td>${msgs.mtitle}</td>
						<td>${msgs.mcount}</td>
						<td>${msgs.aprize}</td>
						<td>${msgs.mprize}</td>
						<td>
							<button>
								<a
									href="${basePath}user/deleteMsgByID?id=${msgs.mid}&uid=${msgs.uid}">删除订单</a>
							</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input value="${mess}" type="hidden" id="message"> <input
				type="hidden" id="hdIndex" value="1">
		</div>

	</div>
</body>
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="${basePath}js/perfect-scrollbar.jquery.min.js"></script>
<script src="${basePath}js/tas.min.js"></script>
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
<script src="${basePath}js/common.min.js"></script>
<script>
	var message = document.getElementById("message").value;
	if (message != null && message != "") {
		alert(message);
	}
</script>
</html>