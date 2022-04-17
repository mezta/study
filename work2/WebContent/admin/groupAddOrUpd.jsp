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
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">会员套餐添加修改</strong><small></small></div>
	</div>
		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
					
						<form role="form"  enctype="multipart/form-data" class="am-form am-form-horizontal" action="../groups/addGroup" method="post" style="padding-top: 30px;">
							<input value="${gid}" name="gid" type="hidden" ><!-- 隐藏的id -->
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									套餐项目1
								</label>
								<div class="am-u-sm-9">
									<select class="form-control" name="courseName1"> 
				                     <c:forEach items="${course}" var="c">
				                         <option value="${c.courseName}">${c.courseName}</option> 
				                     </c:forEach>
				                    </select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									项目1课时
								</label>
								<div class="am-u-sm-9">
									<input type="number" required value="${grouptable.course1Num}" name="course1Num" >
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									套餐项目2
								</label>
								<div class="am-u-sm-9">
									<select class="form-control" name="courseName2"> 
				                     <c:forEach items="${course}" var="c">
				                         <option value="${c.courseName}">${c.courseName}</option> 
				                     </c:forEach>
				                    </select>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									项目2课时
								</label>
								<div class="am-u-sm-9">
									<input type="number" required value="${grouptable.course2Num}" name="course2Num" >
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									价格
								</label>
								<div class="am-u-sm-9">
									<input type="number" required value="${grouptable.price}" name="price" >
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									有效期
								</label>
								<div class="am-u-sm-9">
									<input type="number" required value="${grouptable.day}" name="day" >
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
