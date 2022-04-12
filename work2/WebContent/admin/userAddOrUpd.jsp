<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="../css/admin/amazeui.min.css">
<link rel="stylesheet" href="../css/admin/dmin.css">
<link rel="stylesheet" href="../css/app.css">
<style>
.admin-main {
	padding-top: 0px;
}
</style>
</head>
<body>
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">用户信息添加修改</strong><small></small>
			</div>
		</div>

		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
						<form role="form" enctype="multipart/form-data"
							class="am-form am-form-horizontal" action="../admin/addUser"
							method="post" style="padding-top: 30px;">
							<input value="${uid}" name="uid" type="hidden" ><!-- 隐藏的id -->
							<!-- 隐藏的id -->
							<div class="am-form-group">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户昵称 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${check.nickName}" name="nickName"
										type="text">
								</div>
							</div>
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户名 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${check.uname}" name="uname"
										type="text">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户密码 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${check.upass}" name="upass"
										type="text">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户电话 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${check.telephone}"
										name="telephone" type="text">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户年龄 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${check.age}" name="age"
										type="text">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									用户邮箱 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${check.email}" name="email"
										type="text">
								</div>
							</div>
							
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input id="addRole" class="am-btn am-btn-success" value="提交"
										type="submit"> 
								</div>
							</div>
						</form>
							<input value="${mess}" type="hidden" id="message">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
	var message = document.getElementById("message").value;
	if (message != null && message != "") {
		alert(message);
	}
</script>
</html>