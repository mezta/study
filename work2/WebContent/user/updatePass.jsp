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
				<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改密码</strong><small></small></div>
			</div>
				<div class="am-g">
					<form class="am-form am-form-horizontal"
						 method="post"
						style="padding-top:30px;" data-am-validator action="../user/setUserPass" enctype="multipart/form-data">
						<input type="hidden" readonly="readonly" name="uid" value="${userMain.uid}">
						<input type="hidden"   name="uname"   value="${userMain.uname}" > 
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">
							新密码  </label>
							<div class="am-u-sm-9">
								<input type="password"  name="upass"  id="doc-vld-pwd-1" value="${userMain.upass}"  required placeholder="请输入新密码">
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
							<div class="am-u-sm-9 am-u-sm-push-3">
								<input type="submit" class="am-btn am-btn-success" value="修改密码" />
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
		var mess = "${mess}";
         if(mess !=""){
	        alert(mess);
        } 
	</script>
	</body>
</html> 
