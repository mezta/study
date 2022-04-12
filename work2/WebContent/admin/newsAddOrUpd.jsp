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
			.admin-main{
				padding-top: 0px;
			}
		</style>
	</head>
	<body>
	<div class="admin-content-body">
	<div class="am-cf am-padding am-padding-bottom-0">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">公告添加修改</strong><small></small></div>
	</div>
		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
					
						<form role="form"  enctype="multipart/form-data" class="am-form am-form-horizontal" action="../news/addNews" method="post" style="padding-top: 30px;">
							<input value="${nid}" name="nid" type="hidden" ><!-- 隐藏的id -->
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									公告名称
								</label>
								<div class="am-u-sm-9">
									<input id="" required value="${news.title}" name="title" type="text">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									公告名称
								</label>
								<div class="am-u-sm-9">
									<textarea required  name="content" type="text">${news.content}</textarea>
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
								时间
								</label>
								<div class="am-u-sm-9">
									<input rows="" required  value="${news.startdate}" name="startdate" type="date">
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input id="addRole" class="am-btn am-btn-success" value="提交" type="submit">
									<input id="addRole" class="am-btn am-btn-success" value="重置" type="reset">
								</div>
							</div>
						
							<input value="${mess}" type="hidden" id="message">
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
	<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
			<script type="text/javascript">
			var message=document.getElementById("message").value;
			if(message!=null&&message!=""){
				alert(message);
			}
		
			</script>
</html>
