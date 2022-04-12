<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	    <link rel="stylesheet" href="../css/admin/amazeui.min.css">
		<link rel="stylesheet" href="../css/admin/admin.css">
	<body>
			<div class="admin-content-body">
			<div class="am-cf am-padding am-padding-bottom-0">
				<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改个人信息</strong><small></small></div>
			</div>
				<div class="am-g">
					<form class="am-form am-form-horizontal"
						 method="post"
						style="padding-top:30px;" data-am-validator action="../admin/setAdminInfomation" enctype="multipart/form-data">
						<input type="hidden" readonly="readonly" name="aid" value="${adminInfomation.aid}">
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">
							用户名(登录使用) </label>
							<div class="am-u-sm-9">
								<input type="text" required  name="aname"  required value="${adminInfomation.aname}" placeholder="请输入用户名"> 
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">
							用户昵称(界面显示) </label>
							<div class="am-u-sm-9">
								<input type="text" required name="nickName" value="${adminInfomation.nickName}" required placeholder="请输入用户昵称"> 
							</div>
						</div>
						<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label" >
									图片
								</label>
								<div class="am-u-sm-9">
									<input rows="" required  name="mypic" type="file" cols="50">
								</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">
							新密码  </label>
							<div class="am-u-sm-9">
								<input type="password"  name="apass"  id="doc-vld-pwd-1" value="${adminInfomation.apass}"  required placeholder="请输入新密码">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">
								确认密码</label>
							<div class="am-u-sm-9">
								<input type="password" id="doc-vld-pwd-2" required placeholder="请输入重复密码" 
									name="pwd"  data-equal-to="#doc-vld-pwd-1"  required> 
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">
								email</label>
							<div class="am-u-sm-9">
								<input type="email" id="doc-vld-pwd-2" required value="${adminInfomation.email}" placeholder="请输入邮箱" 
									name="email"  required> 
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<input type="submit" class="am-btn am-btn-success" value="修改信息" />
							</div>
						</div>
					</form>
				</div>
			</div>
		<script src="../js/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="../js/bootstrap.min.js"></script>
		<!-- Placeholder -->
		<script src="../js/jquery.placeholder.min.js"></script>
		<!-- Waypoints -->
		<script src="../js/jquery.waypoints.min.js"></script>
		<!-- Main JS -->
		<script src="../js/main.js"></script>
		<script type="text/javascript">
		
		$("form").submit(function(){
			var	pass1=document.getElementById("doc-vld-pwd-1").value;
			var	pass2=document.getElementById("doc-vld-pwd-2").value;
			if(pass1!=pass2){
				alert("两次密码输入不一致请重新输入");
				return false;
			} 
		})
		
	</script>
	</body>
</html> 
