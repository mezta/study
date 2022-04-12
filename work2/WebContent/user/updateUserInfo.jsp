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
						style="padding-top:30px;" data-am-validator action="../user/setUserInfoMation" enctype="multipart/form-data">
						<input type="hidden" readonly="readonly" name="uid" value="${userMain.uid}">
						<div class="am-form-group">
							<label for="uname" class="am-u-sm-3 am-form-label">
							用户名(登录使用) </label>
							<div class="am-u-sm-9">
								<input type="text" required  name="uname"   value="${userMain.uname}" placeholder="请输入用户名"> 
							</div>
						</div>
						<div class="am-form-group">
							<label for="nickName" class="am-u-sm-3 am-form-label">
							密码  </label>
							<div class="am-u-sm-9">
								<input type="text" required name="upass" value="${userMain.upass}"  placeholder="请输入密码"> 
							</div>
						</div>
						<div class="am-form-group">
							<label for="nickName" class="am-u-sm-3 am-form-label">
							用户昵称(界面显示) </label>
							<div class="am-u-sm-9">
								<input type="text" required name="nickName" value="${userMain.nickName}"  placeholder="请输入用户昵称"> 
							</div>
						</div>
						<div class="am-form-group">
							<label for="telephone" class="am-u-sm-3 am-form-label">
								电话</label>
							<div class="am-u-sm-9">
								<input type="text" id="telephone" required value="${userMain.telephone}" placeholder="请输入电话" 
									name="telephone"  > 
							</div>
						</div>
						<div class="am-form-group">
							<label for="email" class="am-u-sm-3 am-form-label">
								email</label>
							<div class="am-u-sm-9">
								<input type="email" id="email" required value="${userMain.email}" placeholder="请输入邮箱" 
									name="email"  > 
							</div>
						</div>
						<div class="am-form-group">
							<label for="age" class="am-u-sm-3 am-form-label">
								年龄</label>
							<div class="am-u-sm-9">
								<input type="text" id="age" required value="${userMain.age}" placeholder="请输入年龄" 
									name="age"  > 
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
							<input id="addRole" class="am-btn am-btn-success" value="重置" type="reset">
								<input type="submit" class="am-btn am-btn-success" value="修改信息" />
								
							</div>
						</div>
					</form>
						<input value="${mess}" type="hidden" id="message">
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
		<!-- <script type="text/javascript">
			var message = document.getElementById("message").value;
			if (message != null && message != "") {
				alert(message);
			}
		</script> -->
		<script>
			$("form").submit(function(){
				var	telephone=document.getElementById("telephone").value;
				var	email=document.getElementById("email").value;
				if(!checkMobile(telephone)){
					alert("电话号码不符合规则，请重新输入");
					return false;
				} 
				if(!checkEmail(email)){
					alert("email不符合规则，请重新输入");
					return false;
				} 
				
			})
			//验证电话规则
			function
				 checkMobile(str) {
				  var
				 re = /^1(3|4|5|7|8)\d{9}$/
				  if (re.test(str)) {
				    return true;
				  } else {
				    return false;
				  }
			}
		//验证邮箱
		function
			 checkEmail(str){
			  var
			 re = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/
			  if(re.test(str)){
			    return true;
			  }else{
			    return false;
			  }
		}
		var mess = "${mess}";
		         if(mess !=""){
			        alert(mess);
		        } 
		</script>
		
	</body>
</html> 
