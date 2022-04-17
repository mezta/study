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
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">项目添加修改</strong><small></small></div>
	</div>
		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
					
						<form role="form"  enctype="multipart/form-data" class="am-form am-form-horizontal" action="../course/addCourse" method="post" style="padding-top: 30px;">
							<input value="${cid}" name="cid" type="hidden" ><!-- 隐藏的id -->
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									项目名称
								</label>
								<div class="am-u-sm-9">
									<input id="" required value="${course.courseName}" name="courseName" type="text">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									项目时间
								</label>
								<div class="am-u-sm-9">
									<input id="" required value="${course.time}" name="time" type="date">
								</div>
							</div>
								<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									项目分类
								</label>
								<div class="am-u-sm-9">
								<select class="form-control" name="classify"> 
				                         <option value="有氧" >有氧</option> 
				                         <option value="力量" >力量</option> 
				                 </select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									教练名称
								</label>
								<div class="am-u-sm-9">
									<select class="form-control" name="coachId"> 
				                     <c:forEach items="${coach}" var="c">
				                         <option value="${c.id}" ${c.id==course.coachId?'selected':'' }>${c.name}</option> 
				                     </c:forEach>
				                    </select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									教练课时
								</label>
								<div class="am-u-sm-9">
									<input id="" required value="${course.num}" name="num" type="num">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									项目描述
								</label>
								<div class="am-u-sm-9">
									<textarea rows="" cols="50" placeholder="请输入教练描述"  name="content">${course.content}</textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									价格
								</label>
								<div class="am-u-sm-9">
									<input id="" required value="${course.price}" name="price" type="text">
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
