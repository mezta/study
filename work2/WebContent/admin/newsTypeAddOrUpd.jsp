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
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">活动添加修改</strong><small></small></div>
	</div>
			
		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
						<form class="am-form am-form-horizontal" action="../type/addType" method="post" style="padding-top: 30px;">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
								</label>
								<div class="am-u-sm-9">
									<input id="" required="" readonly="readonly" value="${type.tid}" name="tid" type="hidden" >
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									活动标题
								</label>
								<div class="am-u-sm-9">
									<input rows="" required  placeholder="请输入健身知识标题" value="${type.tname}" name="tname" type="text">
									<small>输入标题名称。</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
								活动内容
								</label>
								<div class="am-u-sm-9">
									<textarea  name="tcontent">${type.tcontent}</textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
								开始时间
								</label>
								<div class="am-u-sm-9">
									<input rows="" required  value="${type.startdate}" name="startdate" type="date">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
								结束时间
								</label>
								<div class="am-u-sm-9">
									<input rows="" required  value="${type.enddate}" name="enddate" type="date">
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input id="addRole" class="am-btn am-btn-success" value="提交" type="submit">
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